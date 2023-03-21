import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor/feature/totalscreen.dart';
import 'package:serpismotor/provider/cartprovider.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/views/components/body.dart';
import 'package:badges/badges.dart' as badges;
import 'package:serpismotor/main.dart';
import 'package:serpismotor/database/db_helper.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: buildAppbar(),
        backgroundColor: primaryColor,
        body: Body(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 20, // mengatur jarak dari bawah layar
              left: 20, // mengatur jarak dari sisi kiri layar
              right: 20, // mengatur jarak dari sisi kanan layar
              child: FloatingActionButton(
                elevation: 20,
                hoverColor: Colors.amber,
                onPressed: () {
                  Navigator.push(
                    context,
                    // DetailPage adalah halaman yang dituju
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: Container(
                  height: 70, // mengatur tinggi container
                  decoration: BoxDecoration(
                    color: Color(0xffFFC646),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Biaya",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Consumer<CartProvider>(
                          builder: (BuildContext context, value, Widget? child){
                            final ValueNotifier<int?> totalPrice = ValueNotifier(null);
                            for (var element in value.cart){
                              totalPrice.value =  (element.productPrice! * element.quantity!.value) +
                                  (totalPrice.value ?? 0);

                            }
                            return Row(
                              children: [
                                ValueListenableBuilder<int?>(
                                    valueListenable: totalPrice,
                                    builder: (context, val, child) {
                                      return Text(

                                        "Rp. " + (val?.toStringAsFixed(2) ?? '0')
                                      );
                                    }),


                              ],
                            );
                          },
                        ),
                        badges.Badge(
                          badgeContent: Consumer<CartProvider>(
                            builder: (context, value, child) {
                              return Text(
                                value.cart.length.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ));
  }

  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }
}

