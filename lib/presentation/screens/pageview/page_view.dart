import 'package:flutter/material.dart';
import 'package:qr_book/constant/widget_color/widget_color.dart';
import 'package:qr_book/presentation/screens/pageview/intro_screen_01.dart';
import 'package:qr_book/presentation/screens/pageview/intro_screen_02.dart';
import 'package:flutter/services.dart';
import 'intro_page_03.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IntroPageVIew extends StatefulWidget {



  const IntroPageVIew({Key? key}) : super(key: key);

  @override
  State<IntroPageVIew> createState() => _IntroPageVIewState();
}

class _IntroPageVIewState extends State<IntroPageVIew> {
  List<Widget> _pages = [
    IntroPage1(),
    IntroPage02(),
    IntroPage03()
  ];

  PageController controller = PageController() ;
  int _curr = 0;
  MaterialButton? materialButton;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(children: [
        PageView.builder(
          controller: controller
          ,
          onPageChanged: (int page) {
            setState(() {
              _curr = page;
            });
          },
          itemCount: _pages.length,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  _pages.length,
                      (index) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.00),
                        child: InkWell(
                          onTap: () {
                            controller.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Container(
                            height: _curr == index ? 14.00 : 14.00,
                            width: _curr == index ? 34 : 14.00,
                            decoration: BoxDecoration(color: _curr == index
                                ? primaryColor
                                : Colors.grey,
                                borderRadius: _curr == index ? BorderRadius
                                    .circular(20.0) : BorderRadius.circular(
                                    50.0)),

                          ),
                        ),
                      )),
            ),
          ),
        ),

      ],),
    );
  }
    Widget buidPage(){
      return Center(
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
      );
    }
}
