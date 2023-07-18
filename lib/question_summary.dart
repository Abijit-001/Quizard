import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizard/question_identifier.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionIdentifier(questionIndex: (data['question_index'] as int), isCorrectAnswer: data['user_answer']==data['currect_answer']),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'].toString(),
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(data['user_answer'].toString(),
                              style: GoogleFonts.lato(
                                color: Colors.blue[100],
                                fontSize: 14.0,
                              )),
                          Text(data['currect_answer'].toString(),
                              style: GoogleFonts.lato(
                                color: Colors.blue[50],
                                fontSize: 14.0,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
