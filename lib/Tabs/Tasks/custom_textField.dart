// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  final String hinttext;
  final int? maxLines;
  final TextEditingController controller;


  const customTextFormField({
    Key? key,
    required this.hinttext,
    this.maxLines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      decoration: InputDecoration(
        hintText: hinttext,
      ),
      maxLines: maxLines,
    );
  }
}
