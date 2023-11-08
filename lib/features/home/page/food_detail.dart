import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermvc/features/home/provider/home_provider.dart';
import 'package:fluttermvc/route.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final dataFood = ModalRoute.of(context)!.settings.arguments;
    final jsonData = jsonDecode(dataFood.toString());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage('${jsonData['image']}'),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                '${jsonData['name_lo']}',
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                '${jsonData['price']} ₭',
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('20kip'),
                // card see lueang
                Row(
                  children: [
                    Card(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (count == 0) {
                                    count = 0;
                                  } else {
                                    count--;
                                  }
                                });
                              },
                              icon: Text('-', style: TextStyle(fontSize: 25)),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: Card(
                                elevation: 0,
                                color: Color.fromARGB(255, 240, 236, 236),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text('$count'),
                                ),
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Text('1'),
                            //   color: Colors.white,

                            // ),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                              icon: Text('+', style: TextStyle(fontSize: 25)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final orderData = {
            'name': jsonData['name_lo'],
            'price': jsonData['price'],
            'qty': count
          };
          context.read<HomeProvider>().addOrder(orderData);
          Navigator.pushNamed(context, AppRoute.billOrder);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
