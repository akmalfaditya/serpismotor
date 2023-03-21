import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor/cart/item_model.dart';
import 'package:serpismotor/provider/cartprovider.dart';
import 'package:serpismotor/database/db_helper.dart';
import 'package:serpismotor/cart/cart_model.dart';
import 'package:serpismotor/feature/totalscreen.dart';
import 'package:serpismotor/views/home_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DBHelper dbHelper = DBHelper();

  List<Item> products = [
    Item(
        name: 'Servis Rutin',
        unit: 'pcs',
        price: 65000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti oli mesin dan filter oli',
        unit: 'pcs',
        price: 250000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti filter udara',
        unit: 'pcs',
        price: 100000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti busi',
        unit: 'pcs',
        price: 25000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti kampas rem',
        unit: 'pcs',
        price: 125000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti aki',
        unit: 'pcs',
        price: 250000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Service rantai',
        unit: 'pcs',
        price: 150000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Ganti ban dan balancing roda',
        unit: 'pcs',
        price: 500000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Service rem',
        unit: 'pcs',
        price: 65000,
        image: 'assets/images/tunjungan.jpg'),
    Item(
        name: 'Rem blong:',
        unit: 'pcs',
        price: 125000,
        image: 'assets/images/tunjungan.jpg'),
  ];

  //List<bool> clicked = List.generate(10, (index) => false, growable: true);
  @override
  Widget build(BuildContext context) {
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
          unitTag: products[index].unit,
          image: products[index].image,
        ),
      )
          .then((value) {
        cart.addTotalPrice(products[index].price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(

              color: Colors.white,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 100,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: AssetImage(products[index].image.toString()),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5.0,
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
                                            '${products[index].name.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: 'Rp. ',
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontSize: 16.0),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${products[index].price.toString()}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey.shade900),
                          onPressed: () {

                            setState(() {

                              saveData(index);
                              Navigator.pushReplacement(
                                context,
                                // DetailPage adalah halaman yang dituju
                                MaterialPageRoute(builder: (context) => HomeView()),
                              );
                            });
                          },
                          child: const Text('+')),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
