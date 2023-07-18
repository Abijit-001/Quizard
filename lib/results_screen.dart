import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizard/data/questions.dart';
import 'package:quizard/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'currect_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQusCount = questions.length;
    final totalCorrectCount = summaryData
        .where(
          (element) => element['user_answer'] == element['currect_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You have answered $totalCorrectCount out of $totalQusCount questions correctly!",
                style: GoogleFonts.lato(
                  color: Colors.blue[50],
                  fontSize: 18,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30.0,
            ),
            QuestionSummary(summaryData),
            SizedBox(
              height: 30.0,
            ),
            TextButton.icon(
              onPressed: onRestart,
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.lato(
                  color: Colors.blue[50],
                ),
              ),
              icon: Icon(Icons.refresh, color: Colors.blue[50]),
            ),
          ],
        ),
      ),
    );
  }
}
