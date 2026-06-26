import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            color: const Color.fromARGB(125, 255, 255, 255),
            width: 300,),
          SizedBox(height: 40,),
          Text('Welcome to flutter quiz!',
          style: TextStyle(
            fontSize: 28
          ),),
          SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: startQuiz, 
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.purple
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz'))
        ],
      ),
    );
  }
}