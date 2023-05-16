import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:qr_book/presentation/screens/register_screen/RegisterPage.dart';

import '../../../Cubit/send_otp/send_otp_cubit.dart';
import '../../../Data/entity/send_otp/Data.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../../page_routes/routes_name.dart';
class OtpPage extends StatefulWidget {

   OtpPage({Key? key,}) : super(key: key);



   @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? code;
  List<SendOtpData> otpCode = [];

  @override
  Widget build(BuildContext context) {
     Map<String, dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
       String mobileNumber = args['mobile'] ?? '';

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
                padding: const EdgeInsets.only(top:69.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Pinput(
                      onChanged: (value) {
                        code = value;
                      },
                      length: 4,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                            fontSize: 34,
                            color: miniTextColor,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                        height: 48.0,
                        width: 48.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
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
                                  Center(child: CircularProgressIndicator(),);
                                } else if (state is SendOtpSuccessState) {
                                  final reponse = state.sendOtpResponse
                                      .data;
                                  otpCode = reponse as List<SendOtpData>;
                                  print('$reponse');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                        '${state.sendOtpResponse
                                            .message}')),
                                  );
                                } else if (state is SendOtpErrorState) {
                                  print('error');
                                }
                              },
                              builder: (context, state) {
                                return MaterialButton(
                                  minWidth: 304.00,
                                  height: 52.00,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          26.00)),
                                  onPressed: () {
if(otpCode[0].otpVal != null && otpCode[0].otpVal == otpCode){
  print("sucsess otp verify");
}else{
  print("wrong");
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
                              padding:
                              const EdgeInsets.only(top: 37.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("have Not Recevied OTP  ?"),
                                    TextButton(
                                        onPressed: () {
                                         context.read<SendOtpCubit>().sendOtp(mobileNumber.toString());
                                        },
                                        child: Text(
                                          "Resend",
                                          style:
                                          TextStyle(color: Color(0xFF473F97)),
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
