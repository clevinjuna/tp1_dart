import 'dart:math';

import 'package:flutter/material.dart';

import 'casino_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Casin\'eau'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "You";
  bool _showSuccessMessage = false;
  bool _showErrorMessage = true;
  bool _showSuperSuccessMessage = false;

  int left = 0;
  int center = 0;
  int right = 0;

  void play() {
    setState(() {
      _showSuccessMessage = false;
      _showErrorMessage = false;
      _showSuperSuccessMessage = false;

      left = Random().nextInt(7);
      center = Random().nextInt(7);
      right = Random().nextInt(7);
      print(left);
      if (left == center && center == right) {
        left == 6?_showSuperSuccessMessage =true:_showSuccessMessage=true;
      } else {
        _showErrorMessage = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              CasinoItem(value: left),
              CasinoItem(value: center),
              CasinoItem(value: right),
          ]),
          Row(children: [
              Visibility(
                visible: _showErrorMessage,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                      "you lose",
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.red,
                      ),
                    ),
                ),
              ),
              Visibility(
                visible: _showSuccessMessage,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                      "you win !",
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.green,
                      ),
                    ),
                ),
              ),
              Visibility(
                visible: _showSuperSuccessMessage,
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                      "Jackpot !!",
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.yellow,
                      ),
                    ),
                ),
              ),

          ],)

        ],)
        
            
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: play,
        tooltip: 'retry',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
