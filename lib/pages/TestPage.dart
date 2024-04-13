import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldOtp extends StatelessWidget {
  const TextFieldOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
           children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  width: 1.5,
                  color: Colors.red
                ),
                borderRadius: BorderRadius.circular(6)
              ),
              child: TextField(
                textAlign: TextAlign.center,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                 
                 style: TextStyle(fontSize: 30,),
                decoration: InputDecoration(
                  border: InputBorder.none,
                 constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height/7,maxWidth: MediaQuery.sizeOf(context).width/7),
                ),
              ),
            )
           ],
      ),
    );
  }
}