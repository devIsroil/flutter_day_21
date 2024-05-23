import 'package:flutter/material.dart';

class Task1Screen extends StatelessWidget {
  const Task1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(child: Text("$index",style: TextStyle(fontSize: 30),)),
          );
        },
      ),
    );
  }
}

