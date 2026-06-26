import 'package:flutter/material.dart';

import 'replay_question_model.dart';

class ExamReplayScreen extends StatefulWidget {

  final List<ReplayQuestionModel>
      replayQuestions;

  const ExamReplayScreen({
    super.key,
    required this.replayQuestions,
  });

  @override
  State<ExamReplayScreen> createState() =>
      _ExamReplayScreenState();
}

class _ExamReplayScreenState
    extends State<ExamReplayScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final question =
        widget.replayQuestions[currentIndex];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Exam Replay"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              "Question ${currentIndex + 1}/${widget.replayQuestions.length}",

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              question.question,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...List.generate(
              question.options.length,
              (index) {

                Color color =
                    Colors.grey.shade300;

                if (index ==
                    question.correctAnswerIndex) {
                  color = Colors.green;
                }

                if (index ==
                        question.selectedAnswerIndex &&
                    index !=
                        question.correctAnswerIndex) {
                  color = Colors.red;
                }

                return Container(

                  width: double.infinity,

                  margin:
                      const EdgeInsets.only(bottom: 15),

                  padding:
                      const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: color,

                    borderRadius:
                        BorderRadius.circular(12),
                  ),

                  child: Text(
                    question.options[index],

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                const Icon(Icons.timer),

                const SizedBox(width: 10),

                Text(
                  "Time Spent: ${question.timeSpentSeconds} sec",

                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                ElevatedButton(

                  onPressed: currentIndex == 0
                      ? null
                      : () {

                          setState(() {
                            currentIndex--;
                          });
                        },

                  child: const Text("Previous"),
                ),

                ElevatedButton(

                  onPressed:
                      currentIndex ==
                              widget.replayQuestions
                                      .length -
                                  1
                          ? null
                          : () {

                              setState(() {
                                currentIndex++;
                              });
                            },

                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}