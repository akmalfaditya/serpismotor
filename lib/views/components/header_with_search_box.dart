import 'package:flutter/material.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      height: size.height * 0.20,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: 30 + defaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      child: Text(
                        'Halo,',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Nice to meet you again!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                        Icons.person, color: Colors.black, size: 30,
                    )
                  ),
                ),
              ],
            ),
          ),

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.symmetric(horizontal: defaultPadding),
          //     padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          //     height: 54,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         ),
          //     child: Row(
          //       children: <Widget>[
          //         Expanded(
          //           child: TextField(
          //             onChanged: (value) {},
          //             decoration: InputDecoration(
          //               hintText: "Search",
          //               hintStyle: TextStyle(
          //                 color: Colors.black.withOpacity(0.5),
          //               ),
          //               enabledBorder: InputBorder.none,
          //               focusedBorder: InputBorder.none,
          //             ),
          //           ),
          //         ),
          //         Icon(Icons.search),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
