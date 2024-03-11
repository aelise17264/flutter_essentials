// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  const CounterStateful({super.key});

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

//contains the State class contains the widget's mutable state & the widget's build method
class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;
  void increment() {
    //only available in statefulwidgets
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            increment();
          },
        ),
        body: Center(
            child: Text(
          "$counter",
          style: TextStyle(fontSize: 30),
        )));
  }
}
