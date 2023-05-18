import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:qr_book/presentation/screens/register_screen/RegisterPage.dart';

import '../../../Cubit/login/login_cubit.dart';
import '../../../Cubit/register/register_cubit.dart';
import '../../../Cubit/send_otp/send_otp_cubit.dart';
import '../../../Data/entity/send_otp/Data.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../../page_routes/routes_name.dart';
import '../../passdata.dart';

class OtpPage extends StatefulWidget {
  Object? args;
  OtpPage({Key? key, this.args}) : super(key: key);
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? code;
  int? otpCode;
  String? repoMessage;
  @override
  Widget build(BuildContext context) {
    ScreenArguments? args = ScreenArguments.fromJson(widget.args as Map);
    context.read<SendOtpCubit>().sendOtp(args.mobile.toString());

    print("Address type =====>>>>>> ${args.addressType}");

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Color(0xFF473F97)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Stack(
                children: [
                  SvgPicture.asset('assets/icons/RectangleAppBar.svg'),
                  Positioned(
                      bottom: 32.0,
                      left: 25,
                      child: Text(
                        "Enter Otp",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                      )),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 69.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Pinput(
                      onChanged: (value) {
                        code = value;
                      },
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(
                            fontSize: 34,
                            color: miniTextColor,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: miniTextColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 53.0),
                      child: Center(
                        child: Column(
                          children: [
                            BlocConsumer<SendOtpCubit, SendOtpState>(
                              listener: (context, state) {
                                if (state is SendOtpLoadingState) {
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is SendOtpSuccessState) {
                                  final reponse =
                                      state.sendOtpResponse.data?.otpVal;
                                  repoMessage = state.sendOtpResponse.message;
                                  otpCode = reponse;
                                  print('$reponse');
                                } else if (state is SendOtpErrorState) {
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
                                    if (otpCode == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Please Fill Otp')));
                                      Navigator.pushNamed(
                                          context, AppRouteName.home);
                                    } else if (otpCode.toString() == code) {
                                      if (args.loginRegister == true) {
                                        context.read<LoginCubit>().login(
                                            args.mobile.toString(),
                                            '77544554wwewewewe',
                                            '0');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('${repoMessage}')));
                                      } else if (args.loginRegister == false) {

                                        context.read<RegisterCubit>().register(
                                              args.firstName.toString(),
                                              args.lastName.toString(),
                                              args.email.toString(),
                                              args.mobile.toString(),
                                              "abcde77544554wewewewewe",
                                              "0",
                                              args.addressLine1.toString(),
                                              args.addressLine2.toString(),
                                              args.landMark.toString(),
                                              args.countryId,
                                              args.stateId,
                                              args.cityId,
                                              args.pincode.toString(),
                                              args.addressType?? 1 ,
                                            );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('${repoMessage}')));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Please enter Valid Otp')));
                                    }
                                  },
                                  child: Text(
                                    "Verify",
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
                              padding: const EdgeInsets.only(top: 37.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("have Not Received OTP  ?"),
                                    TextButton(
                                        onPressed: () {
                                          context
                                              .read<SendOtpCubit>()
                                              .sendOtp(args.mobile.toString());
                                        },
                                        child: Text(
                                          "Resend",
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
            ],
          ),
        ),
      ),
    );
  }
}
