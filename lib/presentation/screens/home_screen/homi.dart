import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_book/Cubit/login/login_cubit.dart';

import '../../../Data/entity/login/User.dart';

class Homii extends StatefulWidget {

   Homii({Key? key}) : super(key: key);

  @override
  State<Homii> createState() => _HomiiState();
}

class _HomiiState extends State<Homii> {
List<LoginUser> loginData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [
      BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginLoadingState){
            print("lonadingg.....");
          }else if (state is LoginSuccessState){
            final respons = state.loginResponse.data?.user;
            loginData = respons as List<LoginUser>;
          }else if(state is  LoginErrorState){
            print("Error");
          }
        },
        builder: (context, state) {
          return ListView.builder(
itemCount: loginData.length,
              itemBuilder: (BuildContext context, index) {
                return Text('${loginData[index].email}');
              });
        },
      )
    ],),),);
  }
}
