import 'package:flutter/material.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:fluttermvc/styles/dimensions.dart';

class BtnButton extends StatelessWidget {
  const BtnButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onTap,
        color: greenColor,
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: pa16,
          child: Text(
            title,
            style: const TextStyle(color: textWhite),
          ),
        ),
      ),
    );
  }
}

class BtnButtonRegister extends StatelessWidget {
  const BtnButtonRegister({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onTap,
        color: Colors.transparent,
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: textWhite,style: BorderStyle.solid, width: 1
          )
        ),
        
        child: Padding(
          padding: pa16,
          child: Text(
            title,
            style: const TextStyle(color: textWhite),
          ),
        ),
      ),
    );
  }
}

class BtnButtonOrder extends StatelessWidget {
  const BtnButtonOrder({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onTap,
        color: Colors.orange,
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: pa16,
          child: Text(
            title,
            style: const TextStyle(color: textWhite),
          ),
        ),
      ),
    );
  }
}
