import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor/cart/item_model.dart';
import 'package:serpismotor/provider/cartprovider.dart';
import 'package:serpismotor/database/db_helper.dart';
import 'package:serpismotor/cart/cart_model.dart';
import 'package:serpismotor/feature/totalscreen.dart';
import 'package:serpismotor/views/components/header_with_search_box.dart';
import 'package:serpismotor/views/home_view.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';
import 'package:serpismotor/utils/fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DBHelper dbHelper = DBHelper();

  List<bool> tapped = [];
  TextEditingController searchController = new TextEditingController();
  String filter = "";

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Item> products = [
    Item(
        name: 'Ganti Oli Mesin',
        service: 'Oli',
        price: 40000,
        image: 'assets/images/gantiolimesin.jpeg'),
    Item(
        name: 'Tune Up',
        service: 'Maintenance',
        price: 60000,
        image: 'assets/images/tuneup.jpeg'),
    Item(
        name: 'Starter Mati',
        service: 'Ganti Dinamo Starter',
        price: 40000,
        image: 'assets/images/startermati.jpeg'),
    Item(
        name: 'Starter Mati',
        service: 'Ganti ACCU',
        price: 200000,
        image: 'assets/images/gantiaki.jpeg'),
    Item(
        name: 'Rem Tidak Berfungsi',
        service: 'Cek Kabel Rem',
        price: 60000,
        image: 'assets/images/cekkabelrem.jpeg'),
    Item(
        name: 'Rem Tidak Berfungsi',
        service: 'Ganti Kampas Rem',
        price: 50000,
        image: 'assets/images/gantikampasrem.jpeg'),
    Item(
        name: 'Lampu Mati',
        service: 'Ganti Bohlam',
        price: 60000,
        image: 'assets/images/gantibohlam.jpeg'),
    Item(
        name: 'Lampu Mati',
        service: 'Ganti Soket',
        price: 50000,
        image: 'assets/images/gantisoket.jpeg'),
    Item(
        name: 'Lampu Mati',
        service: 'Cek Kelistrikan',
        price: 30000,
        image: 'assets/images/cekkelistrikan.jpeg'),
    Item(
        name: 'Ganti Busi',
        service: 'Busi',
        price: 15000,
        image: 'assets/images/gantibusi.jpeg'),
    Item(
        name: 'Ganti Filter Udara',
        service: 'Filter Udara',
        price: 55000,
        image: 'assets/images/gantifilter.jpeg'),
    Item(
        name: 'Ganti Kampas Rem',
        service: 'Kampas Rem',
        price: 50000,
        image: 'assets/images/gantikampas.jpeg'),
    Item(
        name: 'Ganti Rantai dan Gear',
        service: 'Rantai & Gear',
        price: 120000,
        image: 'assets/images/gantirantai.jpeg'),
    Item(
        name: 'Ganti Ban',
        service: 'Ban',
        price: 150000,
        image: 'assets/images/gantiban.jpeg'),
    Item(
        name: 'Ganti Aki',
        service: 'Aki',
        price: 200000,
        image: 'assets/images/gantiaki.jpeg'),
    Item(
        name: 'Service Karburator',
        service: 'Karburator',
        price: 85000,
        image: 'assets/images/karburator.jpeg'),
  ];

  //List<bool> clicked = List.generate(10, (index) => false, growable: true);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: products[index].name,
          initialPrice: products[index].price,
          productPrice: products[index].price,
          quantity: ValueNotifier(1),
          service: products[index].service,
          image: products[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(products[index].price.toDouble());
        cart.addCounter();
        cart.getData();
      }).onError((error, stackTrace) {

      });
    }

    Widget productCard(index) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.fromLTRB(
            0, 10, 0, products.length - 1 == index ? 100 : 10),
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
                    image: AssetImage(products[index].image.toString()),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                                  text: '${products[index].name.toString()}\n',
                                  style: header2),
                            ]),
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
                                      '${products[index].service.toString()}\n',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text: 'Rp. ',
                          style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(products[index].price),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 11, child: Container()),
                          Expanded(
                            flex: 9,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: yellowColor,
                                  fixedSize: Size(70, 25)),
                              onPressed: () {
                                setState(() {
                                  saveData(index);

                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   // DetailPage adalah halaman yang dituju
                                  //   MaterialPageRoute(
                                  //       builder: (context) => ProductList()),
                                  // );
                                });
                              },
                              child: const AutoSizeText(
                                'PILIH',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    letterSpacing: 1),
                                minFontSize: 5,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              HeaderWithSearchBox(size: size),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return filter == ""
                          ? productCard(index)
                          : '${products[index].name}'
                                      .toLowerCase()
                                      .contains(filter.toLowerCase()) ||
                                  '${products[index].service}'
                                      .toLowerCase()
                                      .contains(filter.toLowerCase())
                              ? productCard(index)
                              : new Container();
                    }),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 20, // mengatur jarak dari bawah layar
              left: 20, // mengatur jarak dari sisi kiri layar
              right: 20, // mengatur jarak dari sisi kanan layar
              child: FloatingActionButton(
                elevation: 0,
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
                    gradient: gradientColor,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Consumer<CartProvider>(
                              builder: (context, value, child) {
                                return Text(
                                  "${value.cart.length} Services",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Total Biaya",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Consumer<CartProvider>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
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
                                    fontSize: 16,
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
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: TextField(
                        onChanged: (value) {},
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Cari kebutuhan motormu",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: yellowColor,
                          child: Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
