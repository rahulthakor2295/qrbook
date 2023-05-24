import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_book/Cubit/setting/about/about_cubit.dart';
import 'package:qr_book/Cubit/setting/terms_privacy/terms_condition_cubit.dart';

import '../../../../Data/entity/setting/about/Data.dart';
import '../../../../constant/widget_color/widget_color.dart';
import '../../../passdata.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutTermsPage extends StatefulWidget {
  Object? args;
  AboutTermsPage({Key? key, this.args}) : super(key: key);

  @override
  State<AboutTermsPage> createState() => _AboutTermsPageState();
}

class _AboutTermsPageState extends State<AboutTermsPage> {
  List<AboutData> aboutList = [];
  String? pageDescription;
  @override
  Widget build(BuildContext context) {
    ScreenArguments? args = ScreenArguments.fromJson(widget.args as Map);

    if (args.termsCondition == 1) {
      context.read<AboutCubit>().about('ABOUT');
    } else if (args.termsCondition == 2) {
      context.read<TermsConditionCubit>().termsCondition("TERMS_CONDITIONS");
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/icons/SmallContainer.SVG'),
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
                        args.termsCondition == 1
                            ? "About Us"
                            : 'Terms & Privacy',
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
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 26, right: 32),
              child: Center(
                child: BlocConsumer<AboutCubit, AboutState>(
                  listener: (context, state) {
                    if (state is AboutLoadingState) {
                      print("Loading...");
                    } else if (state is AboutSuccessState) {
                      pageDescription =
                          state.aboutResponse.data?.pageDescription;
                    } else if (state is AboutErrorState) {
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      child: Html(
                        data: '${pageDescription ?? ''}',
                        style: {
                          "body": Style(
                            fontSize: FontSize(18.0),
                            color: miniTextColor,
                          ),
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 32),
              child: Center(
                child: BlocConsumer<TermsConditionCubit, TermsConditionState>(
                  listener: (context, state) {
                    if (state is TermsConditionLoadingState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('error')));
                    } else if (state is TermsConditionSuccessState) {
                      pageDescription =
                          state.termsConditionResponse.data?.pageDescription;
                    } else if (state is TermsConditionErrorState) {}
                  },
                  builder: (context, state) {
                    return Container(
                      child: Html(
                        data: '${pageDescription ?? ''}',
                        style: {
                          "body": Style(
                            fontSize: FontSize(18.0),
                            color: miniTextColor,
                          ),
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
