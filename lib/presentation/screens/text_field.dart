import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatefulWidget {
  String? icon;
  String? lable;
  TextFormField? textFormField;

  TextFieldWidget(
      {Key? key, required this.lable, required this.icon, this.textFormField})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.lable}", style: TextStyle(fontSize: 25.0)),
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
                      '${widget.icon}',
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
                          child: widget.textFormField),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
