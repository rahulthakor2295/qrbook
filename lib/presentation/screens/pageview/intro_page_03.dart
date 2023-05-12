import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../../page_routes/routes_name.dart';
import '../login_screen/drive_screen.dart';

class IntroPage03 extends StatelessWidget {
  const IntroPage03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 133.00),
              child: Text(
                "Let's Start !",
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 23,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 100.0, left: 79, right: 108),
                child: Image.asset(
                  'assets/icons/into_page/img_1.png',
                  height: 278.00,
                  width: 212.33,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 73.00),
              child: MaterialButton(
                minWidth: 192.00,
                height: 52.00,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.00)),
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.Login);
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'openSans_normal',

                  ),
                ),
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
