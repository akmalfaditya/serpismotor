import 'package:flutter/material.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';
import 'package:serpismotor/views/components/hot_deals.dart';
import 'package:serpismotor/views/components/title_with_view_all_btn.dart';
import 'package:serpismotor/views/components/top_dealers.dart';
import 'package:serpismotor/views/components/header_with_search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              TitleWithViewAllBtn(title: "Mengalami Kendala?", press: () {}),
              HotDeals(),
              TitleWithViewAllBtn(title: "Tips Merawat Motormu", press: () {}),
              TopDealers(),
              SizedBox(height: defaultPadding),

            ],
          ),
        ),
      ),
    );
  }
}
