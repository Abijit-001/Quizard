import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: "assets/images/quiz-logo.png",
            width: 300,
          ),*/
          Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 300.0,
                  color: Colors.white,
                ),
          const SizedBox(
            height: 80.0,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.lightBlue[50],
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start Quiz",
              ))
        ],
      ),
    );
  }
}
