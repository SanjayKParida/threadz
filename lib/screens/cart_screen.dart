import 'package:ecommerce_app/common/cart_controller.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/widgets/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
              fontFamily: 'Tektur',
              color: Colors.teal,
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: h * 0.13,
              width: w,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          const Icon(IconlyLight.location),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          const Text(
                            '92 High Street London',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: w * 0.25,
                          ),
                          const Icon(IconlyLight.arrow_right_2)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.015,
              width: w,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.0, vertical: 18),
                      child: Row(
                        children: [
                          Text(
                            'Products',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => cartList.isEmpty
                          ? Expanded(
                              child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/empty_cart.svg',
                                  height: h * 0.25,
                                ),
                                SizedBox(
                                  height: h * 0.05,
                                ),
                                const Text(
                                  'Your cart is Empty :(',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          : Expanded(
                              child: Obx(() => ListView.builder(
                                  itemCount: cartList.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return CartProduct(
                                      product: cartList[index],
                                    );
                                  })),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: InkWell(
                          onTap: () {},
                          child: Obx(
                            () => Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.0),
                                gradient: cartList.isEmpty
                                    ? const LinearGradient(colors: [
                                        Color.fromARGB(255, 182, 182, 182),
                                        Color.fromARGB(255, 180, 180, 180)
                                      ])
                                    : const LinearGradient(colors: [
                                        Colors.teal,
                                        Color.fromARGB(240, 12, 190, 148)
                                      ]),
                              ),
                              height: h * 0.075,
                              width: w * 0.9,
                              child: const Center(
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 19.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
