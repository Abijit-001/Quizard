import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizard/answer_button.dart';
import 'package:quizard/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChooseAnswer});

  final void Function(String answer) onChooseAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var qusIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onChooseAnswer(selectedAnswer);
    setState(() {
      // qusIndex += 1;
      qusIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[qusIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 246, 249, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: AnswerButton(answer, () {
                  answerQuestion(answer);
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
