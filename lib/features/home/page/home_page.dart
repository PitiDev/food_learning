import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermvc/core/widgets/btn_button.dart';
import 'package:fluttermvc/features/home/provider/home_provider.dart';
import 'package:fluttermvc/route.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:fluttermvc/styles/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/btn_list.dart';
import '../../../core/widgets/theme_start.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List listFood = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getFood();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments;
    final listFood = context.read<HomeProvider>().modelFood?.dataRes;

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          title: Text('$username'),
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Piti Food',
                      style: TextStyle(
                          fontSize: fontSize16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Open 08-17:00 |',
                          style: TextStyle(fontSize: fontSize14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2.4Km',
                          style: TextStyle(fontSize: fontSize14),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 70,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Review',
                  style: TextStyle(fontSize: fontSize14),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        color: Color(0xFFEF8811),
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: fontSize14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BtnListCategory(title: 'Food', onTap: () {}),
                const SizedBox(
                  width: 10,
                ),
                BtnListCategory(title: 'Drink', onTap: () {}),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: listFood?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    color: textWhite,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.foodDetail,
                              arguments: jsonEncode(listFood![index]));
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage('${listFood![index].image}'),
                        ),
                        title: Text('${listFood[index].nameLo}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sale: ${listFood[index].foodId}'),
                            Text('${listFood[index].price} ₭')
                          ],
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
