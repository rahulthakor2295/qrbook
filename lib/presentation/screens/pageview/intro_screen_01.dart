import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/widget_color/widget_color.dart';
import '../login_screen/drive_screen.dart';
class IntroPage1 extends StatefulWidget {

  const IntroPage1({Key? key}) : super(key: key);

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:133.00),
            child: Text("Scan QR & Learn",style: TextStyle(color: Color(0xFF000000),fontSize: 23,fontWeight: FontWeight.w900),),
          ),
            Padding(
              padding: const EdgeInsets.only(top:126.0,left: 100,right:99),
              child: Container(
                height: 192.0,
                  width: 258.08,
                  child: Image.asset('assets/icons/into_page/img.png'),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:133.140),
              child: MaterialButton(
                onPressed: (){
                },
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(18.22),
                    child: Container(child: Image.asset('assets/icons/into_page/arrow.png',),height: 15.56,width: 16,),
                  ),
                  // Image.asset('assets/icons/into_page/arrow.png',height: 2,),
                  height: 52.00,width: 52.00,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),color: primaryColor),
                ),
              ),
            )
        ],),
      ),
    );
  }
}
