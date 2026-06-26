import 'package:flutter/material.dart';
import 'package:quizdemo/data/questions.dart';
import 'package:quizdemo/questions_screen.dart';
import 'package:quizdemo/results_screen.dart';
import 'package:quizdemo/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        
        activeScreen = 'result-screen';
      }); 
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(chooseAnswer: selectedAnswers,onRestart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Color.fromARGB(255, 98, 15, 112),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ), // Fixed: Added missing closing parenthesis here
          ),
          child: screenWidget// Fixed: Balanced the parenthetical brackets here
        ),
      ),
    );
  }
}
