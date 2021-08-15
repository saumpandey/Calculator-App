import 'dart:ui';

import 'package:calculator/button/button.dart';
import 'package:flutter/material.dart'; 
void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatefulWidget {
 
  const MyCalculator({ Key? key }) : super(key: key);

  @override
 _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  late int firstnumber;
  late int secondnumber;
  late String history = '';
  late String display = '';
  late String result;
  late String operation;
  void button_on_click(String button_value){
    print(button_value);
    if (button_value == 'C') {
      display = '';
      result = '';
      firstnumber = 0;
      secondnumber = 0;
    }
    else if (button_value == 'AC') {
      display = '';
      result = '';
      firstnumber = 0;
      secondnumber = 0;
      history = '';
    }
    else if (button_value == '+' || button_value == '-' || button_value == '*' || button_value == '/' ) {
      firstnumber = int.parse(display);
      operation = button_value;
      result = '';
    }
    else if (button_value == '=') {
      secondnumber = int.parse(display);
      if (operation == '+') {
        result = (firstnumber + secondnumber).toString();
        history = firstnumber.toString() + operation +secondnumber.toString(); 
      }
      if (operation == '-') {
        result = (firstnumber - secondnumber).toString();
        history = firstnumber.toString() + operation +secondnumber.toString(); 
      }
      if (operation == '*') {
        result = (firstnumber * secondnumber).toString();
        history = firstnumber.toString() + operation +secondnumber.toString(); 
      }
      if (operation == '/') {
        result = (firstnumber / secondnumber).toString();
        history = firstnumber.toString() + operation +secondnumber.toString(); 
      }
    }
    else if (button_value == '+/-') { 
      if (display[0] != '-' ) {
        result = '-' + display;
      }
      else{
        result = display.substring(1);
      }
    }
    else if (button_value == '<') {
      result = display.substring(0,display.length - 1); 
    }
    else {
      result = int.parse(display + button_value).toString();
    }
    setState(() {
      display = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Saum's calculator",
      theme: ThemeData(backgroundColor: Colors.lightGreen),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("BASIC CALCULATOR")),backgroundColor: Colors.blueGrey,),
        backgroundColor: Colors.grey,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(history,style: TextStyle(fontSize: 35,color: Color(0xFF616161)),),
              ),
              alignment: Alignment(1,1),)
              ,Container(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(display,
                  style: TextStyle(color: Colors.black,fontSize: 50,),
                ),
              ),
              alignment: Alignment(1,1),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              button(buttonsymbol: 'AC', colour: 0xFFE57373,callback: button_on_click,),
              button(buttonsymbol: 'C',colour: 0xFFE57373,callback: button_on_click,),
              button(buttonsymbol: '<',colour: 0xFFFFCA28,callback: button_on_click,),
              button(buttonsymbol: '/',colour: 0xFFFFCA28,callback: button_on_click,),
            ],),
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              button(buttonsymbol: '9',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '8',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '7',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '*',colour: 0xFFFFCA28,callback: button_on_click,),
            ],),
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              button(buttonsymbol: '6',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '5',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '4',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '-',colour: 0xFFFFCA28,callback: button_on_click,),
            ],),
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              button(buttonsymbol: '3',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '2',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '1',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '+',colour: 0xFFFFCA28,callback: button_on_click,),
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              button(buttonsymbol: '+/-',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '0',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '00',colour: 0xFF546E7A,callback: button_on_click,),
              button(buttonsymbol: '=',colour: 0xFFFFCA28,callback: button_on_click,),
            ],)
          ],)
        ),
      ),
    );
  }
}