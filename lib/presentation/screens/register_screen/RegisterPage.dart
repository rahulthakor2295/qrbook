import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/Cubit/register/register_cubit.dart';
import 'package:qr_book/Cubit/verify_number/verify_number_cubit.dart';
import 'package:qr_book/page_routes/routes_name.dart';

import '../../../Data/repositry/repositry.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../passdata.dart';
import '../text_field.dart';

class RegisterPage extends StatefulWidget {
  Repository? repository;
  RegisterPage({Key? key, this.repository}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fistNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List repoList = [];

  // registrestion or not bool value
  bool? status;
  String? message;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF473F97)),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                SvgPicture.asset('assets/icons/RectangleAppBar.svg'),
                const Positioned(
                    bottom: 32.0,
                    left: 25,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontFamily: 'openSans_normal',
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: PageScrollPhysics(),
                child: Container(

                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: fistNameController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter first name",
                                ),
                                validator: (value) {
                                  if (value!.length <= 2) {
                                    return 'Enter a valid First Name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  fistNameController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'First Name',
                              icon: 'assets/icons/person_ic.SVG',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter last name",
                                ),
                                validator: (value) {
                                  if (value!.length <= 2) {
                                    return 'Enter a valid Last Name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  lastNameController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Last Name',
                              icon: 'assets/icons/person_ic.SVG',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter mobile number",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || value.length != 10) {
                                    return 'Enter a valid Mobile';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  phoneNumberController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Phone Number',
                              icon: 'assets/icons/into_page/phone_ic.SVG',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter email",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return 'Enter a valid email!';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  emailController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Email',
                              icon: 'assets/icons/email_ic.SVG',
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: BlocConsumer<VerifyNumberCubit, VerifyNumberState>(
                                    listener: (context, state) {
                                      if (state is VerifyNumberLoadingState) {
                                        Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (state is VerifyNumberSuccessState) {
                                        final reponse = state.verifyNumberResponse.message;
                                        if (state.verifyNumberResponse.status == true) {
                                          Navigator.pushNamed(
                                              context, AppRouteName.PersonalInfo,
                                              arguments: {
                                                "firstname": "${fistNameController.text}",
                                                "lastname": "${lastNameController.text}",
                                                "mobile": "${phoneNumberController.text}",
                                                "email": "${emailController.text}"
                                              });
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    '${state.verifyNumberResponse.message}')),
                                          );
                                          Navigator.pop(context);
                                        }
                                      } else if (state is VerifyNumberErrorState) {
                                        print('error');
                                      }
                                    },
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 37.0),
                                        child: MaterialButton(
                                          minWidth: 304.00,
                                          height: 52.00,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(26.00)),
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              context.read<VerifyNumberCubit>().VerifyNumber(phoneNumberController.text.toString());
                                            }
                                          },
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'openSans_normal',
                                            ),
                                          ),
                                          color: primaryColor,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
//
// context.read<RegisterCubit>().register(
//       fistNameController.text,
//       lastNameController.text,
//       emailController.text,
//       phoneNumberController.text,
//       "abcde77544554wewewewewe",
//       '0',
//       '',
//       '',
//       '',
//       '',
//       '',
//       '',
//       '',
//     );

// if(_formKey.currentState!.validate()){
// }
