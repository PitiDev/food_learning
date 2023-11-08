import 'package:flutter/material.dart';
import 'package:fluttermvc/styles/colors.dart';

class ThemeStart extends StatelessWidget {
  const ThemeStart({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: appBgColor),
      child: child,
    );
  }
}
