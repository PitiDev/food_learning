import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvc/core/widgets/theme_start.dart';
import 'package:fluttermvc/features/login/provider/login_provider.dart';
import 'package:fluttermvc/route.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/btn_button.dart';
import '../../../styles/dimensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return ThemeStart(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(''),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 50),
              child: Text(
                'ເຂົ້າສູ່ລະບົບ',
                style: TextStyle(
                    color: textWhite,
                    fontSize: fontSize30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 0),
              child: Text(
                'Hello welcome',
                style: TextStyle(
                  color: textWhite,
                  fontSize: fontSize12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Username'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls input username';
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Username",
                              fillColor: Colors.white70,
                            ),
                            controller: username,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('password'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Pls input password';
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "password",
                              fillColor: Colors.white70,
                            ),
                            controller: password,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: BtnButton(
                              title: 'LOGIN',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  provider.login(
                                      username.text, password.text, context);
                                } else {}

                                print('user: ${username.text}');
                                print('pass: ${password.text}');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
