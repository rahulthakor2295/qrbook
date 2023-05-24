import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_book/Cubit/edit_profile/edit_profile_cubit.dart';
import 'package:qr_book/Cubit/login/login_cubit.dart';
import 'package:qr_book/Cubit/personal_info/country/country_cubit.dart';
import 'package:qr_book/Cubit/register/register_cubit.dart';
import 'package:qr_book/Cubit/setting/update_address/update_address_cubit.dart';
import 'package:qr_book/Cubit/verify_number/verify_number_cubit.dart';
import 'package:qr_book/page_routes/routes_name.dart';
import 'package:qr_book/presentation/screens/home_screen/home%20screen.dart';
import 'package:qr_book/presentation/screens/setting/address_managemment/edit_address/update_address.dart';

import '../Cubit/personal_info/State/get_state_cubit.dart';
import '../Cubit/personal_info/city/get_city_cubit.dart';
import '../Cubit/send_otp/send_otp_cubit.dart';
import '../Cubit/setting/about/about_cubit.dart';
import '../Cubit/setting/create_address/create_address_cubit.dart';
import '../Cubit/setting/terms_privacy/terms_condition_cubit.dart';
import '../Data/apiclient/ApiClient.dart';
import '../Data/repositry/repositry.dart';
import '../presentation/screens/home_screen/homi.dart';
import '../presentation/screens/login_screen/login_screen.dart';
import '../presentation/screens/otp_screen/opt_screen.dart';
import '../presentation/screens/pageview/intro_page_03.dart';
import '../presentation/screens/pageview/intro_screen_01.dart';
import '../presentation/screens/pageview/intro_screen_02.dart';
import '../presentation/screens/pageview/page_view.dart';
import '../presentation/screens/personal_info/personal_info.dart';
import '../presentation/screens/register_screen/RegisterPage.dart';
import '../presentation/screens/setting/about_us/about_terms.dart';
import '../presentation/screens/setting/address_managemment/create_address/create_address.dart';
import '../presentation/screens/setting/setting_screen.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/update_profile/update_profile_screen.dart';

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
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      VerifyNumberCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => LoginCubit(repository: repository),
                ),
              ],
              child: LoginPage(
                repository: repository,
              ));
        });
      case AppRouteName.register:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      VerifyNumberCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => RegisterCubit(repository: repository),
                ),
              ],
              child: RegisterPage(
                repository: repository,
              ));
        });

      case AppRouteName.PersonalInfo:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CountryCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => GetStateCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => GetCityCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => RegisterCubit(repository: repository),
                ),
              ],
              child: PersonalInfoPage(
                repository: repository,
                args: settings.arguments,
              ));
        });

      case AppRouteName.OtpPage:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LoginCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => RegisterCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) => SendOtpCubit(repository: repository),
                ),
              ],
              child: OtpPage(
                args: settings.arguments,
              ));
        });
      case AppRouteName.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(repository: repository),
                  child: Homii(),
                ));

      case AppRouteName.setting:
        return MaterialPageRoute(builder: (_) => SettingPage());

      case AppRouteName.aboutTerms:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AboutCubit(repository: repository),
                ),
                BlocProvider(
                  create: (context) =>
                      TermsConditionCubit(repository: repository),
                ),
              ],
              child: AboutTermsPage(
                args: settings.arguments,
              ));
        });
      case AppRouteName.updateProfile:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => EditProfileCubit(repository: repository),
            ),
          ], child: UpdateProfilePage());
        });
      case AppRouteName.createAddress:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CreateAddressCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => CountryCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetStateCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetCityCubit(repository: repository),
            ),
          ], child: CreateAddressPage());
        });
      case AppRouteName.updateAddress:
        return MaterialPageRoute(builder: (BuildContext context) {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => UpdateAddressCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => CountryCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetStateCubit(repository: repository),
            ),
            BlocProvider(
              create: (context) => GetCityCubit(repository: repository),
            ),
          ], child: UpdateAddressPage());
        });

      default:
        return null;
    }
  }
}
