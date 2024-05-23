import 'dart:isolate';

import 'package:flutter/material.dart';

class Task2Screen extends StatefulWidget {
  @override
  _Task2ScreenState createState() => _Task2ScreenState();
}

class _Task2ScreenState extends State<Task2Screen> {
  int result = 0;
  bool isComputing = true;

  @override
  void initState() {
    super.initState();
    startHeavyComputation();
  }

  Future<void> startHeavyComputation() async {
    ReceivePort receivePort = ReceivePort();

    await Isolate.spawn(heavyComputation, receivePort.sendPort);

    receivePort.listen((message) {
      setState(() {
        result = message;
        isComputing = false;
      });
    });
  }

   void heavyComputation(SendPort sendPort) {
    int sum = 0;
    for (int i = 0; i < 10000000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heavy Computation')),
      body: Center(
        child: isComputing
            ? CircularProgressIndicator()
            : Text('Result: $result'),
      ),
    );
  }
}
