import 'package:flutter/material.dart';
import 'package:fluttermvc/features/start/pages/start_page.dart';
import 'package:fluttermvc/route.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:fluttermvc/styles/dimensions.dart';
import 'package:provider/provider.dart';

import 'multi_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providerList,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'PBMelon',
          appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              titleTextStyle:
                  TextStyle(color: textWhite, fontSize: fontSize16))),
      home: const StartPage(),
      routes: AppRoute().getAll,
    );
  }
}
