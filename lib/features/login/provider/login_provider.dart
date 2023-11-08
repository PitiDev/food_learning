import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../route.dart';
import '../../../styles/colors.dart';

class LoginProvider extends ChangeNotifier {
  bool statusLogin = false;

  void login(user, pass, context) {
    print(user);
    print(pass);

    if (user == 'piti' && pass == '123') {
      Navigator.pushNamed(context, AppRoute.homePage, arguments: user);
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Pls Check',
        btnOkColor: primaryColor,
        desc: 'Username or Password',
        btnOkOnPress: () {},
      ).show();
    }
  }
}
