
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  static const Color green = Color(0xFF16A34A);
  static const Color darkGreen = Color(0xFF166534);
  static const Color background = Color(0xFFF7F9FC);
  static const Color textDark = Color(0xFF172033);
  static const Color textMuted = Color(0xFF7B8495);

  static const String storageKey = 'exam_core_notes';

  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> notes = [];
  bool isLoading = true;
  String searchQuery = '';

  final List<String> subjects = [
    'General',
    'Mathematics',
    'English',
    'Physics',
    'Chemistry',
    'Biology',
    'Economics',
    'Government',
    'Literature',
  ];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadNotes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedNotes = prefs.getString(storageKey);

      if (savedNotes != null) {
        final decoded = jsonDecode(savedNotes) as List;

        notes = decoded.map((item) {
          return Map<String, dynamic>.from(item as Map);
        }).toList();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not load your saved notes.'),
          ),
        );
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(storageKey, jsonEncode(notes));
  }

  List<Map<String, dynamic>> get filteredNotes {
    final query = searchQuery.trim().toLowerCase();

    final result = notes.where((note) {
      final title = (note['title'] ?? '').toString().toLowerCase();
      final content = (note['content'] ?? '').toString().toLowerCase();
      final subject = (note['subject'] ?? '').toString().toLowerCase();

      return title.contains(query) ||
          content.contains(query) ||
          subject.contains(query);
    }).toList();

    result.sort((a, b) {
      final dateA = DateTime.tryParse(
        (a['updatedAt'] ?? '').toString(),
      );
      final dateB = DateTime.tryParse(
        (b['updatedAt'] ?? '').toString(),
      );

      return (dateB ?? DateTime(2000))
          .compareTo(dateA ?? DateTime(2000));
    });

    return result;
  }

  Future<void> openNoteEditor({Map<String, dynamic>? note}) async {
    final titleController = TextEditingController(
      text: note?['title']?.toString() ?? '',
    );

    final contentController = TextEditingController(
      text: note?['content']?.toString() ?? '',
    );

    String selectedSubject = subjects.contains(note?['subject'])
        ? note!['subject'].toString()
        : 'General';

    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              title: Text(
                note == null ? 'Create Note' : 'Edit Note',
                style: const TextStyle(
                  color: darkGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
              content: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: titleController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: _inputDecoration(
                          'Note title',
                          Icons.title_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        value: selectedSubject,
                        isExpanded: true,
                        decoration: _inputDecoration(
                          'Subject',
                          Icons.menu_book_rounded,
                        ),
                        items: subjects.map((subject) {
                          return DropdownMenuItem<String>(
                            value: subject,
                            child: Text(subject),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setDialogState(() {
                              selectedSubject = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: contentController,
                        minLines: 5,
                        maxLines: 9,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: _inputDecoration(
                          'Write your study notes...',
                          Icons.edit_note_rounded,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Write something in your note';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: textMuted),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;

                    final now = DateTime.now().toIso8601String();

                    final newNote = <String, dynamic>{
                      'id': note?['id'] ??
                          DateTime.now().microsecondsSinceEpoch.toString(),
                      'title': titleController.text.trim(),
                      'content': contentController.text.trim(),
                      'subject': selectedSubject,
                      'updatedAt': now,
                      'createdAt': note?['createdAt'] ?? now,
                    };

                    setState(() {
                      if (note == null) {
                        notes.add(newNote);
                      } else {
                        final index = notes.indexWhere(
                          (item) => item['id'] == note['id'],
                        );

                        if (index != -1) {
                          notes[index] = newNote;
                        }
                      }
                    });

                    try {
                      await saveNotes();

                      if (!mounted) return;

                      Navigator.pop(dialogContext);

                      ScaffoldMessenger.of(this.context).showSnackBar(
                        SnackBar(
                          content: Text(
                            note == null
                                ? 'Note saved successfully!'
                                : 'Note updated successfully!',
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } catch (e) {
                      if (!mounted) return;

                      ScaffoldMessenger.of(this.context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not save the note.'),
                        ),
                      );
                    }
                  },
                  child: Text(note == null ? 'Save Note' : 'Update Note'),
                ),
              ],
            );
          },
        );
      },
    );

    titleController.dispose();
    contentController.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: green),
      filled: true,
      fillColor: background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Color(0xFFE8EDF2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: green, width: 1.5),
      ),
    );
  }

  Future<void> deleteNote(Map<String, dynamic> note) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete note?'),
          content: Text(
            'Are you sure you want to delete "${note['title']}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    final oldNotes = List<Map<String, dynamic>>.from(notes);

    setState(() {
      notes.removeWhere((item) => item['id'] == note['id']);
    });

    try {
      await saveNotes();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note deleted.')),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        notes = oldNotes;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not delete the note.')),
      );
    }
  }

  void viewNote(Map<String, dynamic> note) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F8EC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      (note['subject'] ?? 'General').toString(),
                      style: const TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    note['title'].toString(),
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SelectableText(
                    note['content'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.7,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(sheetContext);
                            openNoteEditor(note: note);
                          },
                          icon: const Icon(Icons.edit_rounded),
                          label: const Text('Edit'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: green,
                            side: const BorderSide(color: green),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(sheetContext);
                            deleteNote(note);
                          },
                          icon: const Icon(Icons.delete_outline_rounded),
                          label: const Text('Delete'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.symmetric(vertical: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleNotes = filteredNotes;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: textDark,
        elevation: 0,
        title: const Text(
          'My Study Notes',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openNoteEditor(),
        backgroundColor: green,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text(
          'Add Note',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keep your important ideas in one place.',
                    style: TextStyle(
                      color: textMuted,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() => searchQuery = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search notes or subjects...',
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: green,
                      ),
                      suffixIcon: searchQuery.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                searchController.clear();
                                setState(() => searchQuery = '');
                              },
                              icon: const Icon(Icons.close_rounded),
                            ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xFFE8EDF2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xFFE8EDF2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: green),
                    )
                  : visibleNotes.isEmpty
                      ? _emptyState()
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 100),
                          itemCount: visibleNotes.length,
                          itemBuilder: (context, index) {
                            final note = visibleNotes[index];

                            return _noteCard(note);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _noteCard(Map<String, dynamic> note) {
    final date = DateTime.tryParse(
      (note['updatedAt'] ?? '').toString(),
    );

    final dateText = date == null
        ? ''
        : '${date.day}/${date.month}/${date.year}';

    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xFFE8EDF2)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(19),
        onTap: () => viewNote(note),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F8EC),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.sticky_note_2_rounded,
                  color: green,
                  size: 25,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note['title'].toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: textDark,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      note['content'].toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: textMuted,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F8EC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              (note['subject'] ?? 'General').toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: darkGreen,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          dateText,
                          style: const TextStyle(
                            color: textMuted,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    openNoteEditor(note: note);
                  } else if (value == 'delete') {
                    deleteNote(note);
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined, size: 19),
                        SizedBox(width: 10),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red,
                          size: 19,
                        ),
                        SizedBox(width: 10),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 95,
              width: 95,
              decoration: BoxDecoration(
                color: const Color(0xFFE7F8EC),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.note_add_rounded,
                color: green,
                size: 45,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              searchQuery.isEmpty
                  ? 'Your notes start here'
                  : 'No matching notes',
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: textDark,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              searchQuery.isEmpty
                  ? 'Save formulas, definitions, key points and reminders for your JAMB preparation.'
                  : 'Try another search term.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: textMuted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            if (searchQuery.isEmpty) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => openNoteEditor(),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Create your first note'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 13,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
