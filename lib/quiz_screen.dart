import 'dart:async';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  // ================= QUESTION BANK =================

  final Map<String, List<Map<String, dynamic>>> questionBank = {
    "Physics": [
      {
        "question": "Each of the options below consists of a physical quantity and it's corresponding unit EXCEPT?",
        "options": ["acceleration m/s\u00B2", "force kgm/s\u00B2", "momentum NS","potential energy Nm", "power J/s"],
        "answer": 3,
      },
      {
        "question": "A chemical balance is used for measuring?",
        "options": ["volume", "Mass", "thickness", "density"],
        "answer": 1,
      },
      {
        "question": "The motion of a simple pendulum when displaced slightly is?",
        "options": ["circular", "oscillatory", "random", "rotational"],
        "answer": 1,
      },
      {
        "question": "The motion of the wheel of a bicycle moving on a smooth road is?",
        "options": ["oscillatory and random", "oscillatory and translational", "rotational and random", "rotational and translational"],
        "answer": 3,
      },
      {
        "question": "A block of wood of mass 5kg is pulled on a platform by force of 40N.If the frictional force F experienced by the block is 12N.Calculate the magnitude of the acceleration of the block",
        "options": ["2.4m/s\u00B2", "5.6m/s\u00B2", "8.0m/s\u00B2", "10.4m/s\u00B2"],
        "answer": 1,
      },
      {
        "question": "A block is acted upon by two horizontal forces.The block accelerates at 1.5m/s\u00B2.Calculate the mass of the block",
        "options": ["6kg", "9kg", "10kg", "15kg"],
        "answer": 0,
      },
      {
        "question": "A moving car of mass 800kg experiences a frictional force of 200N.If it accelerates at 2m/s\u00B2, calculate the magnitude of the force aoolied to the car.",
        "options": ["600N", "1000N", "1600N", "1800N"],
        "answer": 3,
      },
      {
        "question": "A body of mass 6.0kg rests on a rough horizontal surface where the coeeficient of static friction is 0.25. Determine the magnitude of the limiting frictional force [g =10m/s\u00B2] ?",
        "options": ["240.0N", "150.0N", "60.0N", "15.0N"],
        "answer": 3,
      },
      {
        "question": "A stone is whirled round a circular path of radius 15cm.If the stone makes 30 oscillations in 10 seconds,calculate the angular speed of the stone.[pi=3.14]?",
        "options": ["9.42rad/s", "12.56rad/s", "18.84rad/s", "62.80rad/s"],
        "answer": 2,
      },
      {
        "question": "A mass attached to astring is moving in a circular path.If the speed is doubled,the tension in the string will be?",
        "options": ["doubled", "halved", "four times greater", "one-fourth as much"],
        "answer": 2,
      },
      {
        "question": "A body moves along a circular path with uniform angular speed of 0.6rad/s and at a constant speed of 3.0m/s. Calculate the acceleration of the body towards the center of the circle",
        "options": ["0.2m/s\u00B2", "1.8m/s\u00B2", "5.0m/s\u00B2", "5.4m/s\u00B2"],
        "answer": 1,
      },
      {
        "question": "A particle moves in a circular orbit of radius 0.02 m. If the speed of the particle is 0.88 m/s, calculate its frequency in cycles per second.?",
        "options": ["20Hz", "7.0Hz", "11.0Hz", "12Hz"],
        "answer": 1,
      },
      {
        "question": "A 20‑toothed gear wheel drives a 60‑toothed one. If the angular speed of the smaller wheel is 120 rev/s, the angular speed of the larger wheel is:?",
        "options": ["3.0rev/s", "40.0rev/s", "360rev/s", "2400rev/s"],
        "answer": 1,
      },
      {
        "question": "A satellite revolves around the Earth in a circular orbit. Which of the following statements is correct?",
        "options": [" The centripetal force is provided by the satellite’s engine.",
         "The centripetal force is provided by Earth’s gravity.",
          "The satellite moves with constant velocity.",
           "The satellite has no acceleration"],
        "answer": 1,
      },
      {
        "question": "A body of mass 2 kg moves in a circle of radius 0.4 m with angular velocity 5 rad/s. Calculate its kinetic energy.",
        "options": ["10J", "50J", "25J", "20J"],
        "answer": 3,
      },
      {
        "question": "A 0.5 kg stone is tied to a string and whirled in a vertical circle of radius 2 m at a speed of 10 m/s. Find the tension at the lowest point.",
        "options": ["50N", "20N", "55N", "60N"],
        "answer": 0,
      },
      {
        "question": "Which statement is correct about a body moving in a circle at constant speed??",
        "options": ["Its velocity is constant.",
         " Its acceleration is zero.",
          " Its acceleration is directed towards the centre.", 
          " Its force is directed away from the centre."],
        "answer": 2,
      },
      {
        "question": "A load is pulled 5m along a horizontal floor by a constant force of 20N which acts at 30\u00B0C to the floor.Calculate the workdone by the force",
        "options": ["10J", "17.3J", "50.0J", "86.6J"],
        "answer": 3,
      },
      {
        "question": "Which of the following sources of energy is renewable?",
        "options": ["Petroleum", "Charcoal", "Hydro", "Nuclear"],
        "answer": 2,
      },
      {
        "question": "An object of mass 0.25kg moves at a height h above the ground with a speed of 4m/s.If it's mechanical energy at this height is 12J.Determine the value of h.[g= 10m/s\u00B2]  ?",
        "options": ["0.8m", "4.0m", "4.8m", "5.6m"],
        "answer": 1,
      },
      {
        "question": "An object of mass 0.5kg has kinetic energy of 25J,calculate the speed of the object",
        "options": ["50.0m/s", "25.0m/s", "20.0m/s", "10.0m/s"],
        "answer": 3,
      },
      {
        "question": "A body of mass 1000kg is released from a height of 10m above the ground.Determine its kinetic energy just before it strikes the ground [g= 10m/s\u00B2]",
        "options": ["10J", "10\u00B3J", "10\u2074J", "10\u2075J"],
        "answer": 3,
      },
      {
        "question": "A body of mass 0.6kg is thrown vertically upward from the ground with a velocity of of 20m/s.Calculate it's potential energy at it's maximum height.[g= 10m/s\u00B2]",
        "options": ["12OJ", "12J", "1200J", "1.2J"],
        "answer": 0,
      },
      {
        "question": "A body is pulled through a distance of 500m by a force of 20N.If the power developed is 0.4KW,calculate the time for which the force acts",
        "options": ["250.0s", "25.0s", "2.5s", "0.5s"],
        "answer": 1,
      },
      {
        "question": "A car travelling with a uniform velocity of 30m/s along a horizontal road overcome a constant frictional force of 600N. Calculate the power of the engine of the car",
        "options": ["18KW", "20KW", "180KW", "200KW"],
        "answer": 0,
      },
      {
        "question": "A stone of mass 300g is released from rest from the top of a building of height 100m.Determine the kinetic energy gained by the stone when it is a quarter way down from the point of release.[g= 10m/s\u00B2]",
        "options": ["750.0J", "225.0J", "75.0J", "22.5J"],
        "answer": 2,
      },
      {
        "question": "A ball of mass 100g falls from a height of 5m onto a concrete floor and rebounds to a height of 3m.Calculate the energy lost.[g= 10m/s\u00B2",
        "options": ["2J", "20J", "2000J", "1000J"],
        "answer": 0,
      },
      {
        "question": "A pump is used to raise water from a depth of 20m to fill a reservoir of volume 1800m\u00B3 in 5 hours.Calculate the power of the pump.",
        "options": ["30kW", "25kW", "50kW", "20kW"],
        "answer": 3,
      },
      {
        "question": "The magnitude of the expansion or contraction of a substance depends on the I.temperature change II. nature of substance III.size of substance",
        "options": ["I and II only", "II and III only", "I and III only", "I,II and III"],
        "answer": 3,
      },
      {
        "question": "A rod of initial lenght 2m at a temperature of 25\u0B0CC is heated to 80\u0B0CC,calculate the increase in length of the rod if its linear expansivity is 4.0 x 10\u207B\u00B3K\u207B\u00B9?",
        "options": ["0.26m", "0.44m", "0.53m", "0.84m"],
        "answer": 1,
      },
      {
        "question": "A brass rod is 10m long at 41\u0B0CC.What will be its length at 30\u0B0CC?[linear expansivity of brass = 2.0 x 10*-5k*-1]",
        "options": ["9.9978m", "9.9997m", "10.0002m", "10.0003m"],
        "answer": 0,
      },
      {
        "question": "When brass of length 100cm at 50\u0B0CC is heated,its length changes to 100.054cm at? [linear expansivity of brass = 0.000018k*-1]",
        "options": ["51\u0B0CC", "54\uB0CC", "72\uB0CC", "80\uB0CC"],
        "answer": 3,
      },
      {
        "question": "A metal of length 50cm is heated from 40\uB0CC to 80\uB0CC.If the linear expansivity of the material is \u03B1,calculate the increase in length of the rod (in meters) in terms of \u03B1.?",
        "options": ["20\u03B1", "200\u03B1", "2000\u03B1", "20 000\u03B1"],
        "answer": 0,
      },
      {
        "question": "Calculate the change in length of a wire of length 35m which is heated from a temperature of 10\u0B0CC to 50\uB0CC.[linear expansivity of the material of the wire = 2 x 10\u207B\u2076K\u207B\u00B9]",
        "options": ["1.4 x 10\u207B\u2073m", "2.8 x 10\u207B\u2073m", "3.5 x 10\u207B\u2073m", "4.2 x 10\u207B\u2073m"],
        "answer": 1,
      },
      {
        "question": "The area of a square metal is 600mm\u00B2.Calculate its new area when its temperature is raised by 15K.",
        "options": ["600,057mm\u00B2", "600.114mm\u00B2", "600.171mm\u00B2", "600.342\u00B2"],
        "answer": 3,
      },
      {
        "question": "H2O is called?",
        "options": ["Salt", "Water", "Hydrogen", "Oxygen"],
        "answer": 1,
      },

      
    ],
    "Chemistry": [
      {
        "question": "H2O is called?",
        "options": ["Salt", "Water", "Hydrogen", "Oxygen"],
        "answer": 1,
      },
    ],
    "Mathematics": [
      {
        "question": "2 + 2 = ?",
        "options": ["1", "2", "3", "4"],
        "answer": 3,
      },
    ],
    "English": [
      {
        "question": "Opposite of Good?",
        "options": ["Nice", "Bad", "Fine", "Best"],
        "answer": 1,
      },
    ],
  };

  // ================= VARIABLES =================

  List<String> selectedSubjects = [];
  String activeSubject = "";

  Map<String, int> subjectIndex = {};
  Map<String, Map<int, int>> selectedAnswers = {};

  Map<String, int> subjectScores = {};
  int totalScore = 0;

  bool quizStarted = false;
  bool quizFinished = false;

  // ================= TIMER =================

  int selectedMinutes = 10;

  late int remainingSeconds;

  Timer? timer;

  // ================= START QUIZ =================

  void startQuiz() {
    if (selectedSubjects.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select exactly 4 subjects")),
      );
      return;
    }

    for (String subject in selectedSubjects) {
      subjectIndex[subject] = 0;
      selectedAnswers[subject] = {};
      subjectScores[subject] = 0;
    }

    // START TIMER
    remainingSeconds = selectedMinutes * 60;

    startTimer();

    setState(() {
      quizStarted = true;
      quizFinished = false;
      activeSubject = selectedSubjects[0];
    });
  }

  // ================= TIMER FUNCTIONS =================

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingSeconds > 0) {
          setState(() {
            remainingSeconds--;
          });
        } else {
          timer.cancel();

          submitQuiz();
        }
      },
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  // ================= SELECT ANSWER =================

  void selectAnswer(int optionIndex) {
    final qIndex = subjectIndex[activeSubject]!;

    selectedAnswers[activeSubject]![qIndex] = optionIndex;

    setState(() {});
  }

  // ================= NEXT =================

  void nextQuestion() {
    final maxIndex = questionBank[activeSubject]!.length - 1;

    if (subjectIndex[activeSubject]! < maxIndex) {
      setState(() {
        subjectIndex[activeSubject] =
            subjectIndex[activeSubject]! + 1;
      });
    }
  }

  // ================= PREVIOUS =================

  void previousQuestion() {
    if (subjectIndex[activeSubject]! > 0) {
      setState(() {
        subjectIndex[activeSubject] =
            subjectIndex[activeSubject]! - 1;
      });
    }
  }

  // ================= SUBMIT QUIZ =================

  void submitQuiz() {

    timer?.cancel();

    totalScore = 0;

    for (String subject in selectedSubjects) {
      int score = 0;

      final questions = questionBank[subject]!;

      for (int i = 0; i < questions.length; i++) {

        final correct = questions[i]["answer"];

        final userAnswer = selectedAnswers[subject]?[i];

        if (userAnswer != null && userAnswer == correct) {
          score++;
          totalScore++;
        }
      }

      subjectScores[subject] = score;
    }

    setState(() {
      quizStarted = false;
      quizFinished = true;
    });
  }

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    if (quizFinished) return resultScreen();
    if (!quizStarted) return startScreen();
    return quizBody();
  }

  // ================= START SCREEN =================

  Widget startScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Subjects"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [

          const SizedBox(height: 20),

          Text("Selected: ${selectedSubjects.length}/4"),

          // ================= TIME SELECTION =================

          const SizedBox(height: 20),

          const Text(
            "Select Time",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          DropdownButton<int>(
            value: selectedMinutes,
            items: [10, 20, 30, 45, 60]
                .map(
                  (time) => DropdownMenuItem(
                    value: time,
                    child: Text("$time Minutes"),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedMinutes = value!;
              });
            },
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                subjectCard("Physics", Icons.science, Colors.blue),
                subjectCard("Chemistry", Icons.biotech, Colors.orange),
                subjectCard("Mathematics", Icons.calculate, Colors.purple),
                subjectCard("English", Icons.menu_book, Colors.red),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: startQuiz,
            child: const Text("Start Quiz"),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ================= SUBJECT CARD =================

  Widget subjectCard(
      String subject,
      IconData icon,
      Color color,
      ) {

    bool isSelected = selectedSubjects.contains(subject);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSubjects.remove(subject);
          } else if (selectedSubjects.length < 4) {
            selectedSubjects.add(subject);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),

            const SizedBox(height: 10),

            Text(
              subject,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // ================= QUIZ BODY =================

  Widget quizBody() {

    final question =
        questionBank[activeSubject]![subjectIndex[activeSubject]!];

    final total = questionBank[activeSubject]!.length;

    final current = subjectIndex[activeSubject]! + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        backgroundColor: Colors.green,

        actions: [

          // ================= TIMER DISPLAY =================

          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                formatTime(remainingSeconds),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          TextButton(
            onPressed: submitQuiz,
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedSubjects.map((subject) {

                  bool isActive = subject == activeSubject;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isActive ? Colors.green : Colors.white,

                        foregroundColor:
                        isActive ? Colors.white : Colors.black,
                      ),

                      onPressed: () {
                        setState(() {
                          activeSubject = subject;
                        });
                      },

                      child: Text(subject),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Q$current / $total",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              question["question"],
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            ...List.generate(4, (i) {

              String label = ["A", "B", "C", "D"][i];

              bool isSelected =
                  selectedAnswers[activeSubject]
                  ?[subjectIndex[activeSubject]!] == i;

              return GestureDetector(
                onTap: () => selectAnswer(i),

                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),

                  padding: const EdgeInsets.all(14),

                  decoration: BoxDecoration(
                    color:
                    isSelected ? Colors.green : Colors.white,

                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Text(
                    "$label. ${question["options"][i]}",

                    style: TextStyle(
                      color:
                      isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                ElevatedButton(
                  onPressed: previousQuestion,
                  child: const Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= RESULT SCREEN =================

  Widget resultScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Text(
              "Total Score: $totalScore",

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: selectedSubjects.map((subject) {

                  return Card(
                    child: ListTile(
                      title: Text(subject),

                      subtitle: Text(
                        "Score: ${subjectScores[subject]} / ${questionBank[subject]!.length}",
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            ElevatedButton(
              onPressed: () {

                timer?.cancel();

                setState(() {
                  quizFinished = false;
                  selectedSubjects.clear();
                  totalScore = 0;
                });
              },

              child: const Text("Restart"),
            )
          ],
        ),
      ),
    );
  }

  // ================= DISPOSE =================

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}