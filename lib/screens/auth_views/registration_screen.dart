import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isHidden = true.obs;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  //IMAGE AND CONSTANT WELCOME MESSAGE
                  children: [
                    SvgPicture.asset(
                      'assets/images/register_image.svg',
                      width: w * 0.7,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10, top: 10),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account? ',
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                            SizedBox(
                              width: w * 0.008,
                            ),
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.lato(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ))
                          ],
                        )),
                    SizedBox(
                      height: h * 0.04,
                    ),

                    //TEXTFIELDS TO INPUT CREDENTIALS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Enter your Name"),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Enter E-Mail address"),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: passwordController,
                              obscureText: isHidden.value,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        isHidden.value = !isHidden.value;
                                      },
                                      child: Obx(
                                        () => isHidden.value
                                            ? const Icon(IconlyLight.show)
                                            : const Icon(IconlyLight.hide),
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide:
                                          const BorderSide(color: Colors.teal)),
                                  hintText: "Password"),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),

                          //REGISTER BUTTON
                          GestureDetector(
                            onTap: () {
                              AuthController.instance.register(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            child: Container(
                              height: h * 0.065,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "REGISTER",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                          SizedBox(height: h * 0.04),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
