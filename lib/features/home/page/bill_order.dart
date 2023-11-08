import 'package:flutter/material.dart';
import 'package:fluttermvc/core/widgets/btn_button.dart';
import 'package:fluttermvc/features/home/provider/home_provider.dart';
import 'package:fluttermvc/styles/colors.dart';
import 'package:provider/provider.dart';

class BillOrder extends StatelessWidget {
  const BillOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final dataOrder = context.watch<HomeProvider>().orderList;
    final providerHome = context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Order List'),
        actions: [
          IconButton(
              onPressed: () {
                providerHome.clearOrder();
              },
              icon: const Icon(
                Icons.delete,
                color: textWhite,
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'ບິນສັ່ງອາຫານ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ເມນູ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("ຈຳນວນ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("ລາຄາ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: dataOrder?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "${dataOrder[index]['name']}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text("${dataOrder[index]['qty']}"),
                                Text("${int.parse('${dataOrder[index]['price']}')*int.parse('${dataOrder[index]['qty']}')}"),
                              ],
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        const Text(
                          'ລວມລາຄາ: 10,000 KIP',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BtnButtonOrder(title: 'Order Now', onTap: () {}),
          )
        ],
      ),
    );
  }
}
