import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/Cubit/personal_info/city/get_city_cubit.dart';
import 'package:qr_book/Cubit/personal_info/country/country_cubit.dart';
import 'package:qr_book/Cubit/register/register_cubit.dart';
import 'package:qr_book/Data/repositry/repositry.dart';

import '../../../Cubit/personal_info/State/get_state_cubit.dart';
import '../../../Data/entity/personal_infomation/getCity/Data.dart';
import '../../../Data/entity/personal_infomation/get_country/Data.dart';
import '../../../Data/entity/personal_infomation/get_state/Data.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../../../page_routes/routes_name.dart';
import '../../new/new.dart';
import '../../passdata.dart';
import '../text_field.dart';

enum AddrressType { home, office, other }

class PersonalInfoPage extends StatefulWidget {
  Repository? repository;
  Object? args;
  PersonalInfoPage({Key? key, this.repository, this.args}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  TextEditingController adderess1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  //radio button
  AddrressType _addrressType = AddrressType.home;

  String? countryValue;
  String? stateValue;
  String? cityValue;

  List<Data> country = [];
  List<DataState> stateList = [];
  List<DataCity> cityList = [];

  //response status
  bool? respoStatus;
  String? repoMessage;
  @override
  void initState() {
    context.read<CountryCubit>().country();
    super.initState();
  }

  int? countryId;
  int? stateId;
  int? cityId;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenArguments? args = ScreenArguments.fromJson(widget.args as Map);
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
                      "Personal Information",
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontFamily: 'openSans_normal',
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.00),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("AddressType",
                              style: TextStyle(fontSize: 25.0)),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Radio(
                                    activeColor: primaryColor,
                                    value: AddrressType.home,
                                    groupValue: _addrressType,
                                    onChanged: (AddrressType? value) {
                                      setState(() {
                                        _addrressType = value!;
                                      });
                                    },
                                  ),
                                  title: const Text('Home'),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: const Text('Office'),
                                  leading: Radio(
                                    value: AddrressType.office,
                                    groupValue: _addrressType,
                                    onChanged: (AddrressType? value) {
                                      setState(() {
                                        _addrressType = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: const Text('Other'),
                                  leading: Radio(
                                    value: AddrressType.other,
                                    groupValue: _addrressType,
                                    onChanged: (AddrressType? value) {
                                      setState(() {
                                        _addrressType = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: adderess1Controller,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter address line 1",
                                ),
                                validator: (value) {
                                  if (value!.length <= 2) {
                                    return 'Enter a Valid Address!';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  adderess1Controller.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Address Line 1',
                              icon: 'assets/icons/address.SVG',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: address2Controller,
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter address line 2",
                                ),
                                validator: (value) {
                                  if (value!.length <= 2) {
                                    return 'Enter a Valid Address!';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  address2Controller.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Address Line 2',
                              icon: 'assets/icons/address.SVG',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: landmarkController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter landmark",
                                ),
                                validator: (value) {
                                  if (value!.length <= 2) {
                                    return 'Enter a Valid LandMark!';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  landmarkController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'LandMark',
                              icon: 'assets/icons/address.SVG',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child:
                                Text("Country", style: TextStyle(fontSize: 25.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
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
                                      '${'assets/icons/country.SVG'}',
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
                                        ),
                                        child: BlocConsumer<CountryCubit,
                                            CountryState>(
                                          listener: (context, state) {
                                            if (state is CountryLoadingState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(content: Text('loading')),
                                              );
                                              const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is CountrySuccessState) {
                                              var reponse =
                                                  state.CountryResponse.data;
                                              country = reponse!;
                                            } else if (state is CountryErrorState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(content: Text('error')),
                                              );
                                              print('error');
                                            }
                                          },
                                          builder: (context, state) {
                                            return Flexible(
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                                value: countryValue,
                                                icon: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 20.0),
                                                  child: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 28,
                                                    color: secondryColor,
                                                  ),
                                                ),
                                                items: country.map((Data item) {
                                                  return DropdownMenuItem(
                                                    value: item.name,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Text(
                                                        item.name.toString(),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                hint: Text(
                                                  "Select Country ",
                                                ),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    countryValue =
                                                        newValue! as String?;

                                                    Data? desiredCountry =
                                                        country.firstWhere(
                                                      (country) =>
                                                          country.name == newValue,
                                                    );
                                                    if (desiredCountry != null) {
                                                      countryId = desiredCountry.id;
                                                      context
                                                          .read<GetStateCubit>()
                                                          .getState(countryId);

                                                      print(
                                                          '-----------------------The country code for $newValue is $countryId');
                                                    } else {
                                                      print(
                                                          '-------------------------Country not found');
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text("State", style: TextStyle(fontSize: 25.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
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
                                      '${'assets/icons/locstion.SVG'}',
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
                                        ),
                                        child: BlocConsumer<GetStateCubit,
                                            GetStateState>(
                                          listener: (context, state) {
                                            if (state is GetStateLoadingState) {
                                              const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is GetStateSuccessState) {
                                              var reponseState =
                                                  state.stateResponse.data;
                                              print('response===>$reponseState');
                                              stateList = reponseState!;
                                            } else if (state
                                                is GetStateErrorState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(content: Text('error')),
                                              );
                                              print('error');
                                            }
                                          },
                                          builder: (context, state) {
                                            return Flexible(
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                                value: stateValue,
                                                icon: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 20.0),
                                                  child: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 28,
                                                    color: secondryColor,
                                                  ),
                                                ),
                                                items:
                                                    stateList.map((DataState item) {
                                                  return DropdownMenuItem(
                                                    value: item.name,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Text(
                                                        item.name.toString(),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                hint: Text(
                                                  "Select State ",
                                                ),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    stateValue =
                                                        newValue! as String?;

                                                    DataState? desiredCountry =
                                                        stateList.firstWhere(
                                                      (state) =>
                                                          state.name == newValue,
                                                    );
                                                    if (desiredCountry != null) {
                                                      stateId = desiredCountry.id;
                                                      context
                                                          .read<GetCityCubit>()
                                                          .getCity(stateId);
                                                      print(
                                                          '-----------------------The state code for $newValue is $stateId');
                                                    } else {
                                                      print(
                                                          '-------------------------state not found');
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text("city", style: TextStyle(fontSize: 25.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
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
                                      '${'assets/icons/locstion.SVG'}',
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
                                        ),
                                        child: BlocConsumer<GetCityCubit,
                                            GetCityState>(
                                          listener: (context, state) {
                                            if (state is GetCityLoadingState) {
                                              const Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else if (state
                                                is GetCitySuccessState) {
                                              var reponseCity =
                                                  state.cityResponse.data;
                                              print('response===>$reponseCity');
                                              cityList = reponseCity!;
                                            } else if (state is GetCityErrorState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(content: Text('error')),
                                              );
                                              print('error');
                                            }
                                          },
                                          builder: (context, state) {
                                            return Flexible(
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                                value: cityValue,
                                                icon: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 20.0),
                                                  child: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 28,
                                                    color: secondryColor,
                                                  ),
                                                ),
                                                items:
                                                    cityList.map((DataCity item) {
                                                  return DropdownMenuItem(
                                                    value: item.name,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      child: Text(
                                                        item.name.toString(),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                hint: Text(
                                                  "Select City ",
                                                ),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    cityValue =
                                                        newValue! as String?;

                                                    DataCity? desiredCountry =
                                                        cityList.firstWhere(
                                                      (city) =>
                                                          city.name == newValue,
                                                    );
                                                    if (desiredCountry != null) {
                                                      cityId = desiredCountry.id;
                                                      print(
                                                          '-----------------------The state code for $newValue is $cityId');
                                                    } else {
                                                      print(
                                                          '-------------------------state not found');
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFieldWidget(
                              textFormField: TextFormField(
                                controller: pincodeController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "enter pincode",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || value.length != 6) {
                                    return 'Enter a valid Pincode!';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  pincodeController.value =
                                      value.trim() as TextEditingValue;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              lable: 'Pincode',
                              icon: 'assets/icons/locstion.SVG',
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 47.0,
                                    top: 40.0,
                                  ),
                                  child: MaterialButton(
                                    minWidth: 304.00,
                                    height: 52.00,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(26.00)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (countryValue== null) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text('Pleaase Select Country')));
                                        } else if (stateValue == null) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text('Pleaase Select State')));
                                        } else if (cityValue== null) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text('Pleaase Select City')));
                                        }else{
                                          Navigator.pushNamed(context, AppRouteName.OtpPage,
                                              arguments: {
                                                "firstname": args.firstName.toString(),
                                                "lastname": args.lastName.toString(),
                                                "mobile": args.mobile.toString(),
                                                "email": args.email.toString(),
                                                'login_register': false,
                                                'address_line_1':
                                                adderess1Controller.text.toString(),
                                                'address_line_2':
                                                address2Controller.text.toString(),
                                                'land_mark':
                                                landmarkController.text.toString(),
                                                'country_id': countryId,
                                                'state_id': stateId,
                                                'city_id': cityId,
                                                'pin_code': pincodeController.text.toString(),
                                                'address_type': AddrressType.home ==
                                                    _addrressType
                                                    ? 1
                                                    : (AddrressType.office == _addrressType
                                                    ? 2
                                                    : 3)
                                              });
                                        }


                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'openSans_normal',
                                      ),
                                    ),
                                    color: primaryColor,
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
