import 'dart:math';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 5))..repeat()..addListener(() {setState(() {

    });});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
         gradient: SweepGradient(
           // All magic happens here
           transform: GradientRotation(_controller.value*2*pi),
             colors:const  [
           Colors.grey,Colors.white,Colors.black
         ]
         )
        ),
        child: const Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Text(
                'DAY',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: Text(
                'NIGHT',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
