import 'package:flutter/material.dart';
import 'package:fluttermvc/core/widgets/btn_button.dart';
import 'package:fluttermvc/core/widgets/theme_start.dart';
import 'package:fluttermvc/route.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:fluttermvc/styles/dimensions.dart';

import '../../../core/widgets/icons.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeStart(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(70),
              child: Text(
                'ສະບາຍດີ',
                style: TextStyle(color: textWhite, fontSize: 50),
              ),
            ),
            // SizedBox(height: 200,),
            const Spacer(),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: BtnButton(
                title: 'LOGIN',
                onTap: () {

                 Navigator.pushNamed(context, AppRoute.loginPage);
                  //Navigator.pushReplacementNamed(context, AppRoute.loginPage);
                 
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: BtnButtonRegister(
                title: 'Register',
                onTap: () {
                  print('Register');
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Login with',
                style: TextStyle(color: textWhite),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconS(
              icccons: () {},
              ontap: () {},
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
