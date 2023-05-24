import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/page_routes/routes_name.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/icons/SmallContainer.SVG'),
                Positioned(
                  top: 79.39,
                  left: 38.33,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'assets/icons/Vector.png',
                        ),
                      ),
                      SizedBox(
                        width: 15.7,
                      ),
                      Text(
                        "Settings ",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.aboutTerms,
                      arguments: {
                        'terms_condition': 1,
                      });
                },
                child: Text('about Us')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.aboutTerms,
                      arguments: {
                        'terms_condition': 2,
                      });
                },
                child: Text('Terms And condition')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.updateProfile);
                },
                child: Text('profile')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.createAddress);
                },
                child: Text('create Address')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.updateAddress);
                },
                child: Text('update Address')),
          ],
        ),
      ),
    );
  }
}
