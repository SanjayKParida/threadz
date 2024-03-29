import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/services/favourite_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Favorites',
            style: TextStyle(
                fontFamily: 'Tektur',
                fontSize: 32.0,
                color: Colors.teal,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => favoriteList.isEmpty
              ? Scaffold(
                  body: Padding(
                    padding: EdgeInsets.only(left: w * 0.15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/add_product_warning.svg',
                          height: h * 0.3,
                        ),
                        SizedBox(
                          height: h * 0.04,
                        ),
                        const Text(
                          'You don\'t have any favorites :(',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: h * 0.025),
                  child: Column(
                    children: [
                      Expanded(
                          child: Obx(
                        () => GridView.builder(
                            itemCount: favoriteList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: h * 0.27),
                            itemBuilder: ((context, index) {
                              return Obx(() => ProductCard(
                                  productDetails: favoriteList[index]));
                            })),
                      )),
                    ],
                  ),
                ),
        ));
  }
}
