import 'package:flutter/material.dart';
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

        fit: StackFit.passthrough,
        children: [
          Positioned(
            child: FloatingActionButton(
              onPressed: (){},
              child: Text(
                "Total: Rp. 10.000"
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppbar(){
    return AppBar(

      elevation: 0,
      backgroundColor: backgroundColor,

    );
  }
}
