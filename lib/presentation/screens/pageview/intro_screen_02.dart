import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/widget_color/widget_color.dart';

class IntroPage02 extends StatelessWidget {

  const IntroPage02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:133.00),
              child: Text("Scan QR & Save Notes",style: TextStyle(color: Color(0xFF000000),fontSize: 23,fontWeight: FontWeight.w900),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:100.0,left: 79,right:108),
              child: Image.asset('assets/icons/into_page/workbook.png',height: 278.00,width: 212.33,)
            ),
            Padding(
              padding: const EdgeInsets.only(top:73.00),
              child: Container(
                child: Container(child: Image.asset('assets/icons/into_page/arrow.png',),height: 15.56,width: 16,),
                // Image.asset('assets/icons/into_page/arrow.png',height: 2,),
                height: 52.00,width: 52.00,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),color: primaryColor),
              ),
            )
          ],),
      ),
    );
  }
}
