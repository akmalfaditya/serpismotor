import 'package:flutter/material.dart';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/utils/sizes.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          HotDealCard(
            image: "assets/images/tunjungan.jpg",
            title: "Tidak Bisa Stater",
            location: "Servis Kecil",
            price: 200090,
            press: () {
            },
          ),
          HotDealCard(
            image: "assets/images/tunjungan.jpg",
            title: "Klakson Mati",
            location: "Servis Kecil",
            price: 238000,
            press: () {
            },
          ),
        ],
      ),
    );
  }
}

class HotDealCard extends StatelessWidget {
  const HotDealCard({Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.press,
  }) : super(key: key);
  final String image, title, location;
  final int price;
  final Function press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double widthCard = size.width * 0.6;
    return Container(
      margin: EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 2,
        bottom: defaultPadding * 2.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      width: widthCard,
      child: GestureDetector(
        onTap: press(),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(left: defaultPadding, top: defaultPadding),
              child: Text(
                "$title",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(left: defaultPadding, bottom: defaultPadding/2),
              child: Text(
                "$location",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor.withOpacity(0.5)),
              ),
            ),
            Image.asset(image),
            Container(
              width: widthCard,
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.only(right: defaultPadding, bottom: defaultPadding/2, top: defaultPadding/2),
              child: Text(
                'Rp $price',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor),

              ),
            ),
            SizedBox(
              width: widthCard,
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.only(
                     bottomRight: Radius.circular(10),
                     bottomLeft: Radius.circular(10)
                   ),
                 ), 
                ),
                child: Text(
                  "Tambahkan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
