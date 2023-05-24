import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:qr_book/Cubit/login/login_cubit.dart';
import 'package:qr_book/Cubit/verify_number/verify_number_cubit.dart';
import 'package:qr_book/Data/repositry/repositry.dart';
import 'package:qr_book/constant/widget_color/widget_color.dart';
import 'package:qr_book/page_routes/routes_name.dart';

import '../../passdata.dart';

class LoginPage extends StatefulWidget {
  late Repository repository;
  LoginPage({Key? key, required this.repository,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Color(0xFF473F97)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                  child: Stack(
                children: [
                  SvgPicture.asset('assets/icons/RectangleAppBar.svg',),
                  Positioned(
                      bottom: 32.0,
                      left: 25,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                      )),
                ],
              )),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 25.0, right: 25.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phone Number", style: TextStyle(fontSize: 25.0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Form(
                        key: _loginkey,
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                    child: SvgPicture.asset(
                                  'assets/icons/into_page/phone_ic.SVG',
                                  height: 20.0,
                                )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Container(
                                    width: double.minPositive,
                                    decoration: BoxDecoration(
                                      color: Colors.white,

                                      // borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Enter mobile no",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Center(
                        child: Column(
                          children: [
                            BlocConsumer<VerifyNumberCubit, VerifyNumberState>(
                              listener: (context, state) {
                                if (state is VerifyNumberLoadingState) {
                                  Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is VerifyNumberSuccessState) {
                                  final reponse =
                                      state.verifyNumberResponse.message;
                                  if(state.verifyNumberResponse.status == true){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${state.verifyNumberResponse.message}')),
                                    );
                                    Navigator.pushNamed(context, AppRouteName.register);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${state.verifyNumberResponse.message}')),
                                    );
                                    Navigator.pushNamed(context, AppRouteName.OtpPage,arguments: {
                                      'mobile' : phoneController.text,
                                      'login_register' : true,
                                    });
                                  }
                                } else if (state is VerifyNumberErrorState) {
                                  print('error');
                                }
                              },
                              builder: (context, state) {
                                return MaterialButton(
                                  minWidth: 304.00,
                                  height: 52.00,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(26.00)),
                                  onPressed: () {
                                    loginValidator();
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'openSans_normal',
                                    ),
                                  ),
                                  color: primaryColor,
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don'n have an account ?"),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AppRouteName.register);
                                        },
                                        child: Text(
                                          "Register Now",
                                          style: TextStyle(
                                              color: Color(0xFF473F97)),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, AppRouteName.setting);
                }
                ,child:Text("setting")),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loginValidator() {
    if (_loginkey.currentState!.validate()) {
      if (phoneController.length == 10) {
        context.read<VerifyNumberCubit>().VerifyNumber(phoneController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('wrong')),
        );
      }
    }
  }
}
