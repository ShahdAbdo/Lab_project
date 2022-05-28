import 'dart:async';
import 'package:flutter/material.dart';
import 'homescreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
  Timer(
      const Duration(seconds:7),() =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  const HomeScreen()))
      );
    return Scaffold(
      backgroundColor: const Color(0xFFE9EAEE),
      body:Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80,),
              Image.asset('assets/music.png', height: 200, width: 200,),
              const SizedBox(height: 120,),
              ElevatedButton(
              child: const Text('Get Start',),
              // style: ElevatedButton.styleFrom(
              //   shadowColor: Colors.purple
              // ),
                style: ElevatedButton.styleFrom(
                primary:  const Color(0xFF1321E0),
                padding:
                const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),

              onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const HomeScreen()));
              },
                ),
          ],)
        ) 
      
    );
  }
}