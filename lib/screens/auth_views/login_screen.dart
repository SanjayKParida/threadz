import 'package:ecommerce_app/screens/auth_views/forget_screen.dart';
import 'package:ecommerce_app/screens/auth_views/registration_screen.dart';
import 'package:ecommerce_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var isHidden = true.obs;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      'assets/images/login_image.svg',
                      width: w * 0.7,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your details to login...',
                            style: GoogleFonts.ubuntuCondensed(fontSize: 20.0),
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
                              'Or',
                              style: GoogleFonts.lato(fontSize: 16),
                            ),
                            SizedBox(
                              width: w * 0.008,
                            ),
                            GestureDetector(
                                onTap: () => Get.to(RegistrationScreen()),
                                child: Text(
                                  'REGISTER',
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
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide:
                                        const BorderSide(color: Colors.teal)),
                                hintText: "Enter Email address"),
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
                            height: h * 0.03,
                          ),

                          //FORGOT PASSWORD
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(const ForgotPassword()),
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),

                          //LOGIN BUTTON
                          GestureDetector(
                            onTap: () {
                              AuthController.instance.signIn(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                            },
                            child: Container(
                              height: h * 0.06,
                              width: w * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "LOGIN",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                          SizedBox(height: h * 0.025),
                          Text(
                            'Or continue with',
                            style: GoogleFonts.lato(),
                          ),
                          //SOCIAL BUTTONS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () => AuthService().signInWithGoogle(),
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.teal.withOpacity(0.2),
                                            offset: const Offset(0.0, 2.0),
                                            blurRadius: 4.0,
                                          )
                                        ]),
                                    height: h * 0.12,
                                    width: w * 0.12,
                                    child: Image.asset(
                                      'assets/icons/google.png',
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.teal.withOpacity(0.2),
                                            offset: const Offset(0.0, 2.0),
                                            blurRadius: 4.0,
                                          )
                                        ]),
                                    height: h * 0.12,
                                    width: w * 0.12,
                                    child: Image.asset(
                                      'assets/icons/facebook.png',
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.teal.withOpacity(0.2),
                                            offset: const Offset(0.0, 2.0),
                                            blurRadius: 4.0,
                                          )
                                        ]),
                                    height: h * 0.12,
                                    width: w * 0.12,
                                    child: Image.asset(
                                      'assets/icons/twitter.png',
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
