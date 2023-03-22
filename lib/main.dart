import 'package:flutter/material.dart';
import 'dart:async';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/views/home_view.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Splash',
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: backgroundColor,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: textColor, fontFamily: 'Poppins'),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProductList())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }
}
