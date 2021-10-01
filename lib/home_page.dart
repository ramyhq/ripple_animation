// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ripple_animation/consts/slider_style.dart';

import 'models/ripple_animation.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO 1 Variables
  bool isPlaying = false;
  double volume = 0.5;
  String moodName = '';

  //TODO 2 Methods

  // 1- getRangeLevel() for slider lable
  String getRangeLevel() {
    if (volume >= 0.00 && volume < 0.25) {
      moodName = 'Muted';
    } else if (volume >= 0.25 && volume < 0.50) {
      moodName = 'Low ';
    } else if (volume >= 0.50 && volume < 0.75) {
      moodName = 'Medium';
    } else if (volume >= 0.75 && volume < 1.00) {
      moodName = 'High';
    } else if (volume >= 1.00 && volume < 2.0) {
      moodName = 'Extra High';
    }
    return moodName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffcc00),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Ripple Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO 4 Create Stack with RippleAnimation inside SizedBox
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                    height: 300,
                    child: isPlaying ? RippleAnimatedButton(child:Container(),volume:volume): Container(),),
                GestureDetector(
                  onTap: (){
                    setState((){
                      if(volume == 0) volume = 0.50;
                      isPlaying = !isPlaying;
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xffff0059),
                    child: Icon(Icons.volume_up,size: 60,color: Colors.black87),
                  ),
                ),
              ],
            ),

            //TODO 3 The Slider
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30)
              ),
              child: SliderTheme(
                data: sliderTheme,
                child: Slider(
                  divisions: 4,
                  label: getRangeLevel(),
                  min: 0,
                  max: 1,
                  value: volume,
                  onChanged: (_value) {
                    setState(() {
                      volume = _value;
                      if(_value == 0){ isPlaying = false;}
                      else if(_value > 0){isPlaying = true;}
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
