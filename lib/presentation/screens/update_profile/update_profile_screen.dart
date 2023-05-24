import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/Cubit/edit_profile/edit_profile_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../constant/widget_color/widget_color.dart';
import '../text_field.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController fistNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _editKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  File? file;
  XFile? pickedImage;
 String? avatar;
  Future pickImageFromGallery() async {
    print("ssdsdsdsdfsfsfsdfsdfsdfds");
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(pickedImage!.path);
    });
    imageCache.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("-----------------------------------------------Edit---------------------------------------------");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                SvgPicture.asset(
                  'assets/icons/SmallContainer.SVG',
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 79.39,
                  left: 38.33,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'assets/icons/Vector.png',
                        ),
                      ),
                      SizedBox(
                        width: 15.7,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontFamily: 'openSans_normal',
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: PageScrollPhysics(),
              child: Container(
                child: Form(
                  key: _editKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black26,
                                radius: 50,
                                child: file != null
                                    ? CircleAvatar(
                                        radius: 46.22,
                                        backgroundImage: FileImage(
                                          file!,
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 46.22,
                                        backgroundImage: NetworkImage(
                                            '$avatar'),
                                      ),
                              ),
                              Positioned(
                                top: 60.0,
                                right: 0.0,
                                child: Container(
                                  height: 28.00,
                                  width: 28.00,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          pickImageFromGallery();
                                        },
                                        icon: SvgPicture.asset(
                                            'assets/icons/edit.SVG')),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ), //CircleA
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 37.0),
                                  child: BlocConsumer<EditProfileCubit,
                                      EditProfileState>(
                                    listener: (context, state) {
                                      if (state is EditProfileLoadingState) {
                                        CircularProgressIndicator();
                                      } else if (state
                                          is EditProfileSuccessState) {
                                         avatar = state.editProfileResponse.data?.user?.avatar;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text("Success")));
                                      } else if (state
                                          is EditProfileErrorState) {
                                        CircularProgressIndicator();
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
                                          print("click---------------------------");
                                          context
                                              .read<EditProfileCubit>()
                                              .editProfile(
                                                  fistNameController.text
                                                      .toString(),
                                                  lastNameController.text
                                                      .toString(),
                                                  emailController.text
                                                      .toString(),
                                                  file);
                                        },
                                        child: Text(
                                          "Save",
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
    );
  }

  void _checkPermission(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    Map<Permission, PermissionStatus> statues = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    PermissionStatus? statusCamera = statues[Permission.camera];
    PermissionStatus? statusStorage = statues[Permission.storage];
    PermissionStatus? statusPhotos = statues[Permission.photos];
    bool isGranted = statusCamera == PermissionStatus.granted &&
        statusStorage == PermissionStatus.granted &&
        statusPhotos == PermissionStatus.granted;
    if (isGranted) {
      print("Gramophone-----------");
      // pickImageFromGallery();
    }
    bool isPermanentlyDenied =
        statusCamera == PermissionStatus.permanentlyDenied ||
            statusStorage == PermissionStatus.permanentlyDenied ||
            statusPhotos == PermissionStatus.permanentlyDenied;
    if (isPermanentlyDenied) {}
  }
}
