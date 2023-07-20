import 'package:flutter/material.dart';
import 'package:quizard/data/questions.dart';
import 'package:quizard/questions_screen.dart';
import 'package:quizard/results_screen.dart';

import 'home.dart';
import 'main.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'Home';

  /* @override
  void initState() {
    activeScreen =  Home(switchScreen);
    super.initState();
  }*/
  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionsScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    print(selectedAnswer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "ResultScreen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'QuestionsScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreen == 'Home'
        ? Home(switchScreen)
        : activeScreen == 'ResultScreen'
            ? ResultScreen(
                chosenAnswers: selectedAnswer,
                onRestart: restartQuiz,
              )
            : QuestionsScreen(onChooseAnswer: chooseAnswer);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: startAlignment,
                end: endAlignment,
                colors: [startColor, midColor, endColor]),
          ),
          child: screenWidget,
        ),
        // body: GradientContainer.Default(),
      ),
    );
  }
}
