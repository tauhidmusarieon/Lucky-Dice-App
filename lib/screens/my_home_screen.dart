import 'dart:math';

import 'package:flutter/material.dart';

class my_home_screen extends StatefulWidget {
  const my_home_screen({super.key});

  @override
  State<my_home_screen> createState() => _my_home_screenState();
}

class _my_home_screenState extends State<my_home_screen> {

int left_dice = 1;
int right_dice = 2;

int total_click = 0;
int match_dice = 0;

double match_percentage = 0.0;

void changeDice(){
  setState(() {
    
    total_click++;
    left_dice = Random().nextInt(6) + 1;
    right_dice = Random().nextInt(6) + 1;

    if(left_dice == right_dice){
      match_dice++;
    }

    if(total_click != 0)
    {
      match_percentage = match_dice / total_click;
    }

    if(total_click == 50)
    {
      total_click = 0; match_dice = 0; match_percentage = 0.000; 
    }

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Lucky Dice",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset("assets/dice$left_dice.png",color : left_dice == right_dice ? Colors.lightGreenAccent : Colors.white,),
                
                ),
                SizedBox(width: 05,),
                Expanded(
                  child: Image.asset("assets/dice$right_dice.png", color: left_dice == right_dice ? Colors.lightGreenAccent : Colors.white),
                ),
                
              ],
              
            ),
            SizedBox(height: 10,),
            
            Text("Totol Click : ${total_click}",style: TextStyle(color: Colors.white),),
            Text("Totol Match : ${match_dice}",
              style: TextStyle(color: Colors.white),
            ),
            Text("Total Match percentage : ${(match_percentage*100).toStringAsFixed(3)}%",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeDice();
                  },

                  child: Text("Change Dice", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
          
        ),
      ),

    );
  }
}