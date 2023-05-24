import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
       return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF473F97)),
        child: Scaffold(
        body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
    Stack(
    children: [
    SvgPicture.asset('assets/icons/RectangleAppBar.svg'),
    Positioned(
    bottom: 32.0,
    left: 25,
    child: Text(
    "Personal Information",
    style: TextStyle(
    fontSize: 34,
    color: Colors.white,
    fontFamily: 'openSans_normal',
    fontWeight: FontWeight.w600),
    )),
    ],
    ),
  ]
    ),
    ),
    ),);
  }
}
