import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/dimensions.dart';

class BtnListCategory extends StatelessWidget {
  const BtnListCategory({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onTap,
        color: orageColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Padding(
          padding: pa6,
          child: Text(
            title,
            style: const TextStyle(color: textWhite),
          ),
        ),
      ),
    );
  }
}