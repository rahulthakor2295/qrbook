import 'package:flutter/material.dart';

class Homii extends StatelessWidget {
  final String  myName;

  const Homii({Key? key, required this.myName,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("$myName"),);
  }
}
