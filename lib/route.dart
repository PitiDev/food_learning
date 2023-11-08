import 'package:flutter/material.dart';
import 'package:fluttermvc/features/home/page/bill_order.dart';
import 'package:fluttermvc/features/home/page/food_detail.dart';
import 'package:fluttermvc/features/home/page/home_page.dart';
import 'package:fluttermvc/features/login/pages/login_page.dart';
import 'package:fluttermvc/features/start/pages/start_page.dart';

class AppRoute {
  static const startPage = '/start_page';
  static const loginPage = '/login_page';
  static const homePage = '/homePage';
  static const foodDetail = '/foodDetail';
  static const billOrder = '/billOrder';

  final route = <String, WidgetBuilder>{
    startPage: (context) => const StartPage(),
    loginPage: (context) => const LoginPage(),
    homePage: (context) => const HomePage(),
    foodDetail: (context) => const FoodDetail(),
    billOrder: (context) => const BillOrder()
  };

  get getAll => route;
}
