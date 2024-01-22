import 'package:ecommerce_app/common/navigation_controller.dart';
import 'export_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NavigationScreen extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  NavigationScreen({super.key});

  final screens = [
    const HomeScreen(),
    CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: bottomNavigationController.selectedIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              bottomNavigationController.changeIndex(index);
            },
            currentIndex: bottomNavigationController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.bag), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.heart), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.user_2), label: "Profile"),
            ],
          ),
        ));
  }
}
