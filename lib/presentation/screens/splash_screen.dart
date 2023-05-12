import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_book/page_routes/routes_name.dart';
class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  Map? _info;

  void _getInfo() async {
    // Instantiating the plugin
    final deviceInfoPlugin = DeviceInfoPlugin();

    final result = await deviceInfoPlugin.deviceInfo;
    setState(() {
      _info = result.data;
    });
  }
  @override
  void initState() {
    _getInfo();
    Timer(
     const   Duration(seconds: 3),
            () => Navigator.pushNamed(context, AppRouteName.pageView));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("${_info}");
    return Scaffold(
      backgroundColor: const Color(0xFF473F97),
        body: SvgPicture.asset('assets/icons/splash.SVG',fit: BoxFit.cover,));
  }
}
