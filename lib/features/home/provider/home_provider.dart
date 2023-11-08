import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvc/core/configs/config.dart';
import 'package:fluttermvc/features/home/models/model_food.dart';

class HomeProvider extends ChangeNotifier {
  List foodDataFromAPI = [];
  List orderList = [];

  ModelFood? modelFood;

  final dio = Dio();

  getFood() async {
    final response = await dio.get('${Config.baseApi}/get_foods');
    print('response: $response');
    modelFood = ModelFood.fromJson(response.data);
  }

  getDrink() async {
    final response = await dio.get('${Config.baseApi}/get_drinks');
    print('response: $response');
  }

  addOrder(order) {
    orderList.add(order);
    print('order array: $orderList');
  }

  clearOrder() {
    orderList.clear();
    notifyListeners();
  }

  clearItemOrder(order) {
    orderList.remove(order);
    notifyListeners();
  }
}
