import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_book/Cubit/personal_info/country/country_cubit.dart';
import 'package:qr_book/Cubit/register/register_cubit.dart';
import 'package:qr_book/Cubit/verify_number/verify_number_cubit.dart';
import 'package:qr_book/page_routes/routes_name.dart';

import '../Cubit/personal_info/State/get_state_cubit.dart';
import '../Cubit/personal_info/city/get_city_cubit.dart';
import '../Cubit/send_otp/send_otp_cubit.dart';
import '../Data/apiclient/ApiClient.dart';
import '../Data/repositry/repositry.dart';
import '../presentation/passdata.dart';
import '../presentation/screens/login_screen/drive_screen.dart';
import '../presentation/screens/login_screen/login_screen.dart';
import '../presentation/screens/otp_screen/opt_screen.dart';
import '../presentation/screens/pageview/intro_page_03.dart';
import '../presentation/screens/pageview/intro_screen_01.dart';
import '../presentation/screens/pageview/intro_screen_02.dart';
import '../presentation/screens/pageview/page_view.dart';
import '../presentation/screens/personal_info/personal_info.dart';
import '../presentation/screens/register_screen/RegisterPage.dart';
import '../presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generaterRoute(RouteSettings settings) {
    ApiClient apiClient = ApiClient(Dio());
    Repository repository = Repository(apiClient: apiClient);
    switch (settings.name) {
      case AppRouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SpalshScreen());
      case AppRouteName.pageView:
        return MaterialPageRoute(builder: (_) => const IntroPageVIew());
      case AppRouteName.scanLearn:
        return MaterialPageRoute(builder: (_) => IntroPage1());
      case AppRouteName.saveNotes:
        return MaterialPageRoute(builder: (_) => IntroPage02());
      case AppRouteName.start:
        return MaterialPageRoute(builder: (_) => IntroPage03());
      case AppRouteName.Login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VerifyNumberCubit(repository: repository),
            child: LoginPage(repository: repository,),
          ),
        );
      case AppRouteName.register :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => RegisterCubit(repository: repository),
          child: RegisterPage(repository: repository,),
        ));
      case AppRouteName.PersonalInfo :
        final ScreenArguments? data = settings.arguments as ScreenArguments?;


        return MaterialPageRoute(builder: (BuildContext context){
          print("${settings.name} ------ ${settings.arguments}");
          final data = settings.arguments as ScreenArguments;
          print("---------${data.message}");
          return  MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CountryCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetStateCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetCityCubit(repository: repository),
            ),
          ], child: PersonalInfoPage(repository: repository,mobile: data.message,));

        });

      case AppRouteName.OtpPage :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => SendOtpCubit(repository: repository),
          child: OtpPage(),
        ),
        );

      default:
        return null;
    }
  }
}
