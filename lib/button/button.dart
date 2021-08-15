import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String buttonsymbol;
  final int colour;
  final Function callback;
  const button({
    required this.buttonsymbol,
    required this.colour,
    required this.callback
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin: EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 70, 
                  width: 70,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                      color: Color(colour),
                      child: Text(buttonsymbol,
                       style: TextStyle(
                         fontSize: 40,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                         ),
                         ),
                  onPressed: () => {callback(buttonsymbol)},
                  ),
                 ),
               )  ;
  }
}