import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.text,this.onChanged});
  String? text;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     onChanged: onChanged,
      validator:(value){
        if (value!.isEmpty)
        {
          return 'can\'t be Empty';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
