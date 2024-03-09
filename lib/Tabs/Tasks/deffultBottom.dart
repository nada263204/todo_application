// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_application/app_Theme.dart';

class defultButtom extends StatelessWidget {
  String textt;
  VoidCallback onPressed;
  defultButtom({
    Key? key,
    required this.textt,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        backgroundColor: Theme.of(context).primaryColor
      ),
      onPressed: onPressed, child: Text(textt,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.White),));
  }
}
