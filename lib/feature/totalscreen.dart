import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import 'package:provider/provider.dart';
import 'package:serpismotor/database/db_helper.dart';
import 'package:serpismotor/cart/cart_model.dart';
import 'package:serpismotor/provider/cartprovider.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:serpismotor/utils/fonts.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          child: Container(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return const Center(
                      child: Text(
                    'Kosong',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ));
                } else {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                      shrinkWrap: true,
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.white,
                          elevation: 0.0,
                          margin: EdgeInsets.fromLTRB(0,10,0,provider.cart.length - 1 == index ? 100 : 10),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              height: 120,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    child: Image(
                                      height: 120,
                                      width: 150,
                                        fit: BoxFit.cover,
                                      image:
                                      AssetImage(provider.cart[index].image!),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(

                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  color: Colors.blueGrey.shade800,
                                                  fontSize: 16.0),
                                              children: [
                                                TextSpan(
                                                    text:
                                                    '${provider.cart[index].productName!}\n',
                                                    style: header2),
                                              ]),
                                        ),
                                        RichText(
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  color: Colors.blueGrey.shade800,
                                                  fontSize: 16.0),
                                              children: [
                                                TextSpan(
                                                    text:
                                                    '${provider.cart[index].service!}\n',
                                                    style: TextStyle(
                                                        color:
                                                        Colors.black45,
                                                        fontFamily:
                                                        'Poppins',
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600)),
                                              ]),
                                        ),
                                        RichText(
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: 'Rp. ',
                                              style: TextStyle(
                                                  color: Colors
                                                      .blueGrey.shade800,
                                                  fontSize: 16.0,
                                                  fontFamily: 'Poppins',
                                                  fontWeight:
                                                  FontWeight.w600),
                                              children: [
                                                TextSpan(
                                                  text: NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: '',
                                                    decimalDigits: 0,
                                                  ).format(
                                                      provider.cart[index].productPrice!),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),

                                              ]),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 105,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              width: 75,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: yellowColor,
                                                    fixedSize: Size(90, 25)),
                                                onPressed: () {
                                                  setState(() {
                                                    dbHelper!.deleteCartItem(
                                                        provider.cart[index].id!);
                                                    provider
                                                        .removeItem(provider.cart[index].id!);
                                                    provider.removeCounter();
                                                  });
                                                },
                                                child: const Text(
                                                  'HAPUS',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       dbHelper!.deleteCartItem(
                                  //           provider.cart[index].id!);
                                  //       provider
                                  //           .removeItem(provider.cart[index].id!);
                                  //       provider.removeCounter();
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.delete,
                                  //       color: Colors.red.shade800,
                                  //     )),
                                ],
                              ),

                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              final ValueNotifier<int?> totalPrice = ValueNotifier(null);
              for (var element in value.cart) {
                totalPrice.value =
                    (element.productPrice! * element.quantity!.value) +
                        (totalPrice.value ?? 0);
              }
              return Container(
                height: 85,
                color: Colors.amber,
                child: Column(
                  children: [
                    ValueListenableBuilder<int?>(
                        valueListenable: totalPrice,
                        builder: (context, val, child) {
                          return ReusableWidget(
                              title: 'Total Biaya Service',
                              value: r'Rp.' + (val?.toStringAsFixed(0) ?? '0'));
                        }),
                  ],
                )
              );
            },
          )
        ],
      ),
      // bottomNavigationBar: InkWell(
      // onTap: () {
      // ScaffoldMessenger.of(context).showSnackBar(
      // const SnackBar(
      // content: Text('Payment Successful'),
      //duration: Duration(seconds: 2),
      // ),
      //);
      //},
      //child: Container(
      //color: Colors.yellow.shade600,
      //alignment: Alignment.center,
      //height: 50.0,
      //child: const Text(
      //'Proceed to Pay',
      //style: TextStyle(
      //fontSize: 18.0,
      //fontWeight: FontWeight.bold,
      //),
      //),
      //),
      //),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
