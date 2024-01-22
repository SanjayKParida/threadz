import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Tektur',
              fontSize: 32.0,
              color: Colors.teal,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            height: h * 0.13,
            width: w,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 12, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //PERSONAL DETAILS
                  const Text(
                    'Sanjay K. Parida',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  SizedBox(
                    height: h * 0.007,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'test123@gmail.com',
                        style: TextStyle(fontFamily: 'Lato', fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'verify',
                          style: TextStyle(
                              color: Colors.teal,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: h * 0.04,
          ),
          //SETTING CARDS
          InkWell(
            onTap: () {},
            child: SettingCard(
              h: h,
              w: w,
              leadingIcon: const Icon(
                IconlyLight.star,
                color: Colors.teal,
              ),
              title: 'ThreadZ Points',
              sizeBetween: 0.365,
            ),
          ),

          //SUPPORT AND LEGAL
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Support & Legal',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.0008,
          ),
          InkWell(
            onTap: () {},
            child: SettingCard(
              h: h,
              w: w,
              leadingIcon: const Icon(
                IconlyLight.info_circle,
                color: Colors.teal,
              ),
              title: 'Contact Support',
              sizeBetween: 0.34,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          InkWell(
            onTap: () {},
            child: SettingCard(
                h: h,
                w: w,
                leadingIcon: const Icon(
                  IconlyLight.document,
                  color: Colors.teal,
                ),
                title: 'Terms & Conditions',
                sizeBetween: 0.28),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.0008,
          ),
          InkWell(
            onTap: () {
              AuthController.instance.logout();
            },
            child: SettingCard(
              h: h,
              w: w,
              leadingIcon: const Icon(
                IconlyLight.logout,
                color: Colors.teal,
              ),
              title: 'Logout',
              sizeBetween: 0.535,
            ),
          ),
          SizedBox(
            height: h * 0.04,
          ),
          const Text(
            'version 0.0.1 | 0_PRTCL',
            style: TextStyle(fontFamily: 'Lato'),
          )
        ]),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.h,
    required this.w,
    required this.leadingIcon,
    required this.title,
    required this.sizeBetween,
  });

  final double h;
  final double w;
  final Icon leadingIcon;
  final String title;
  final double sizeBetween;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: h * 0.085,
      width: w * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0),
        child: Row(
          children: [
            leadingIcon,
            SizedBox(
              width: w * 0.033,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(
              width: w * sizeBetween,
            ),
            const Icon(IconlyLight.arrow_right_2)
          ],
        ),
      ),
    );
  }
}
