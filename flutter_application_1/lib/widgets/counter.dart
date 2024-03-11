// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  Color buttonColor;

  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

//contains the State class contains the widget's mutable state & the widget's build method
class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;
  void increment() {
    // mounted - to avoid runtime crashes & not perform setState on an unmounted State
    if (mounted) {
      //setState - only available in statefulwidgets
      setState(() {
        counter++;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // widget creation
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //destroy widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: widget.buttonColor,
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
