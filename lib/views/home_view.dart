import 'package:flutter/material.dart';
import 'package:serpismotor/feature/totalscreen.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/views/components/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
              onPressed: () {
                Navigator.push(
                  context,
                  // DetailPage adalah halaman yang dituju
                  MaterialPageRoute(
                      builder: (context) => CartScreen()
                  ),
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
                      Text(
                        "Rp. 50.000",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  AppBar buildAppbar(){
    return AppBar(

      elevation: 0,
      backgroundColor: backgroundColor,

    );
  }
}
