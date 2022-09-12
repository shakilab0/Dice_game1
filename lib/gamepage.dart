import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  int score=0,highestScore = 0,point = 0,index1 = 0,index2 = 0;
  final random = Random.secure();
  bool gameOver = false;
  bool playAgain=false;
  bool startGame=true;
  bool gameLosser=false;
  final diceList=<String> [
    'assets/images/d1.png',
    'assets/images/d2.png',
    'assets/images/d3.png',
    'assets/images/d4.png',
    'assets/images/d5.png',
    'assets/images/d6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GAME"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Score: $score",style: TextStyle(fontSize: 30),),
            Text("HighestScore: $highestScore",style: TextStyle(fontSize: 30),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(diceList[index1],width: 100,height: 100,),
                SizedBox(width: 10,),
                Image.asset(diceList[index2],width: 100,height: 100,),
              ],
            ),
            Text("Total Point : $point",style: TextStyle(fontSize: 30),),
            if(gameOver)Text("Game over !!!",style: TextStyle(fontSize: 40,color: Colors.green),),
            if(gameLosser)Text("Game Lost you !!!",style: TextStyle(fontSize: 40,color: Colors.green),),

            if(startGame)ElevatedButton(
              onPressed: (){
                rollTheDice();
              },
              child: Text("Click the Dice",style: TextStyle(fontSize: 20),),
            ),

            if(playAgain)ElevatedButton(
              onPressed: (){
                rollTheDice2();
              },
              child: Text("Play Again!"),
            ),

          ],
        ),
      ),
    );
  }

  void rollTheDice() {
    setState(() {
      index1=random.nextInt(6);
      index2=random.nextInt(6);

      point=index1+index2+2;

      if(point==7 ){
        gameOver =true;
        if(highestScore < score)highestScore = score;
        playAgain=true;
        startGame=false;
      }else{
        score += point;
      }
    });
  }

  void rollTheDice2() {
    setState(() {
      gameOver =false;
      playAgain=false;
      gameLosser=false;
      index1=0;
      index2=0;
      score=0;
      point=0;
      startGame=true;

    });
  }


}
