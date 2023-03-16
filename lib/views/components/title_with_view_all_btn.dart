import 'package:flutter/material.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';

class TitleWithViewAllBtn extends StatelessWidget {
  const TitleWithViewAllBtn({Key? key, required this.title, required this.press}) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: defaultPadding/4),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                ),
              ),
              Spacer(),
              TextButton(
                onPressed: press(),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  backgroundColor: Colors.amber,
                ),
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
