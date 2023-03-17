import 'package:flutter/material.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';
import 'package:serpismotor/views/components/hot_deals.dart';
import 'package:serpismotor/views/components/title_with_view_all_btn.dart';
import 'package:serpismotor/views/components/top_dealers.dart';
import 'package:serpismotor/views/components/header_with_search_box.dart';
import 'package:serpismotor/feature/isiserpis.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor/cart/item_model.dart';
import 'package:serpismotor/provider/cartprovider.dart';
import 'package:serpismotor/database/db_helper.dart';
import 'package:serpismotor/cart/cart_model.dart';
import 'package:serpismotor/feature/totalscreen.dart';
import 'dart:io' as io;


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

        child: Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              ProductList(),



            ],
          ),
        ),

    );
  }
}
