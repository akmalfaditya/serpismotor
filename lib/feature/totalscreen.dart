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
        toolbarHeight: 80,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Text(
                'Total Estimasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Biaya Servis',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: yellowColor,
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 15,
              ),
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
                    'Anda Belum Menambah Item',
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
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          elevation: 0.0,
                          margin: EdgeInsets.fromLTRB(0, 10, 0,
                              provider.cart.length - 1 == index ? 100 : 10),
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
                                      image: AssetImage(
                                          provider.cart[index].image!),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [

                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: '',
                                              style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade800,
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
                                                  color:
                                                      Colors.blueGrey.shade800,
                                                  fontSize: 16.0),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${provider.cart[index].service!}\n',
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ]),
                                        ),
                                        RichText(
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: 'Rp. ',
                                              style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade800,
                                                  fontSize: 16.0,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600),
                                              children: [
                                                TextSpan(
                                                  text: NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: '',
                                                    decimalDigits: 0,
                                                  ).format(provider.cart[index]
                                                      .productPrice!),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ]),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                flex:11,
                                                child: Container()
                                            ),

                                              Expanded(
                                                flex:9,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          yellowColor,
                                                      fixedSize: Size(70, 25)),
                                                  onPressed: () {
                                                    setState(() {
                                                      dbHelper!.deleteCartItem(
                                                          provider
                                                              .cart[index].id!);
                                                      provider.removeItem(provider
                                                          .cart[index].id!);
                                                      provider.removeCounter();
                                                    });
                                                  },
                                                  child: const Text(
                                                    'HAPUS',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                                flex:1,
                                                child: Container()
                                            ),
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
                  decoration: BoxDecoration(
                      gradient: gradientColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<CartProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                      "${value.cart.length} Services",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    );
                                  },
                                ),

                                Text(
                                  "Total Estimasi Biaya Servis",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Consumer<CartProvider>(
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    final NumberFormat currencyFormat =
                                        NumberFormat.currency(
                                            locale: 'id_ID', symbol: 'Rp. ');
                                    int totalPrice = 0;
                                    for (var element in value.cart) {
                                      totalPrice += (element.productPrice! *
                                          element.quantity!.value);
                                    }
                                    return Text(
                                      currencyFormat.format(totalPrice),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
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
