import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snakBar(
    BuildContext context, String? content) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(content!)));
}
