import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/Cubit/register/register_cubit.dart';
import 'package:qr_book/page_routes/routes_name.dart';

import '../../../Data/entity/register/Data.dart';
import '../../../Data/repositry/repositry.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../passdata.dart';
import '../text_field.dart';

class RegisterPage extends StatefulWidget {
  Repository? repository;
   RegisterPage({Key? key,this.repository}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Column(
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: TextFieldWidget(
                          // validator:nameValidator,
textEditingController: fistNameController,
                          lable: 'First Name',
                          icon: 'assets/icons/into_page/phone_ic.SVG',
                          hintText: 'enter first name',
                        ),
                      ),
                      TextFieldWidget(
                        // validator: lastnameValidator,
                        textEditingController: lastNameController,
                        lable: 'Last Name',
                        icon: 'assets/icons/person_ic.SVG',
                        hintText: 'enter last name',
                      ),
                      TextFieldWidget(
                        // validator: validateMobile,
                        textEditingController: phoneNumberController,
                        lable: 'Phone Number',
                        icon: 'assets/icons/into_page/phone_ic.SVG',
                        hintText: 'enter phone name',
                      ),
                      TextFieldWidget(
                        // validator: emailValidator,
                        textEditingController: emailController,
                        lable: 'Email Address',
                        icon: 'assets/icons/email_ic.SVG',
                        hintText: 'enter email address',),
                    ],
                  ),
                ),
              ),

      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if(state is RegisterLoadingState){
      const Center(child: CircularProgressIndicator(),);
    }else if(state is RegisterSuccessState){
      final reponse = state.RegisterResponse.data;
      status = state.RegisterResponse.status;
      // message = state.RegisterResponse.message;
      print('$reponse');
      // repoList = reponse as List<Data>;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${state.RegisterResponse.message}')),
      );
      print("${reponse}");
    }else if (state is RegisterErrorState){
      print('error');
    }
  },
  builder: (context, state) {
    return MaterialButton(
                minWidth: 304.00,
                height: 52.00,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.00)),
                onPressed: () {
                  // context.read<RegisterCubit>().register(
                  //    fistNameController.text,
                  //    lastNameController.text,
                  //    emailController.text,
                  //    phoneNumberController.text,
                  //   "abcde77544554wewewewewe",
                  //   '0',
                  //   '',
                  //   '',
                  //   '',
                  //   '',
                  //   '',
                  //   '',
                  //   '',
                  // );
                  //   final myData = {
                  //     'mobile' : 'rahul',
                  //     // 'firstName' : fistNameController.text,
                  //     // 'lastName' : lastNameController.text,
                  //     // 'email' : emailController.text,
                  //   };

                    // Navigator.pushNamed(context, AppRouteName.PersonalInfo,arguments: {
                    //   'mobile' : '9601582609'
                    // });
                  Navigator.pushNamed(
                    context,
                    AppRouteName.PersonalInfo,
                    arguments: ScreenArguments('Hello', 'World'),
                  );
                  // if(_formKey.currentState!.validate()){
                  // }
                },
                child: Text(
                  "Register",
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
            ),
            Padding(
              padding:
              const EdgeInsets.only( top: 25.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don'n have an account ?"),
                    TextButton(
                        onPressed: () {
Navigator.pushNamed(context, AppRouteName.PersonalInfo) ;                       },
                        child: Text(
                          "Login",
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
            ],
          ),
        ),
      ),
    );
  }
 String? emailValidator(String  value){
    if(value.isEmpty || !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
      return "Enter Correct Email Address";
    }else{
      return null;
    }
  }
  String? nameValidator(String value){
    if(value.isEmpty || !RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)").hasMatch(value)){
      return "Enter Correct Name";
    }
    return null;
  }
  String? lastnameValidator(String value){
    if(value.isEmpty || !RegExp(r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)").hasMatch(value)){
      return "Enter Correct Name";
    }
    return null;
  }
  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
}
//email Validator
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}