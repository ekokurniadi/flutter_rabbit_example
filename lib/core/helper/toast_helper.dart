import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'theme_helper.dart';

class ToastHelper {
  toastSuccess(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: secondaryColor,
      title: "Success",
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  toastError(BuildContext context, String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: alertColor,
      title: "Error",
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
