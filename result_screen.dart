import 'package:flutter/material.dart';
import 'package:flutter_pract/replay_question_model.dart';


import 'exam_replay_screen.dart';

class ResultScreen extends StatelessWidget {

  final int score;
  final int totalQuestions;

  final List<ReplayQuestionModel>
      replayQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.replayQuestions,
  });

  @override
  Widget build(BuildContext context) {

    double percentage =
        (score / totalQuestions) * 100;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Result"),
      ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.emoji_events,
                size: 100,
                color: Colors.orange,
              ),

              const SizedBox(height: 20),

              Text(
                "$score / $totalQuestions",

                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "${percentage.toStringAsFixed(1)}%",

                style: const TextStyle(
                  fontSize: 28,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(

                  onPressed: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            ExamReplayScreen(
                          replayQuestions:
                              replayQuestions,
                        ),
                      ),
                    );
                  },

                  icon: const Icon(Icons.replay),

                  label: const Text(
                    "Replay Exam",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}