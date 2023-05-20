import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice app',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Dice App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text("Dice roller"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const Dice());
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int imageno1 = 1;
  int imageno2 = 2;

  void  setRandomNumber() {
    int number1 = Random().nextInt(6) + 1;
    int number2 = Random().nextInt(6)+1;
    if(number1!= number2){
      setState(() {
        imageno1 = number1;
        imageno2 = number2;
      });
    }
    else{
      setRandomNumber();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
                onTap: () {setRandomNumber();},
                child: Image.asset("assets/images/dice${imageno1}.png")),
          )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
                onTap: () {setRandomNumber() ;},
                child: Image(
                  image: AssetImage("assets/images/dice${imageno2}.png"),
                  fit: BoxFit.cover,
                )),
          ))
        ],
      ),
    );
  }
}
