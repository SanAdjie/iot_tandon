import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableInput extends StatelessWidget {

  final String label;
  final Function(String) onChanged;
  final bool rahasia;
  final String jenisKeyboard;

  ReusableInput({required this.label, required this.onChanged, required this.rahasia, required this.jenisKeyboard});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: (jenisKeyboard == "email")? TextInputType.emailAddress: TextInputType.text,
      style: TextStyle(color: kBGHitam),
      obscureText: rahasia,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          filled: true,
          fillColor: kBGAbu2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          labelText: label
      ),
      onChanged: onChanged,
    );
  }
}
