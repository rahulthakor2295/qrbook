 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_book/presentation/screens/home_screen/home%20screen.dart';
import 'package:qr_book/page_routes/routes.dart';
 import 'package:device_info_plus/device_info_plus.dart';

import 'constant/widget_color/widget_color.dart';
void main() async{
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: secondryColor));
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
  runApp( QrBook(
    router: AppRouter(),
  ));
}

class QrBook extends StatelessWidget {

    AppRouter? router;
   QrBook({super.key,this.router});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //       statusBarColor:secondryColor),),
        scaffoldBackgroundColor: scaffoldColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:primaryColor,
        ),

      ),
onGenerateRoute: router?.generaterRoute,);
  }
}


