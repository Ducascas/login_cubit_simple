import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: 'Please enter your $hintText!',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}