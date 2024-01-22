import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                IconlyBroken.arrow_left_2,
                color: Colors.black,
                size: h * 0.035,
              ))),
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
                      'assets/images/forgot_password_image.svg',
                      width: w * 0.7,
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10.0, left: 10, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: GoogleFonts.ubuntuCondensed(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),

                    //TEXTFIELDS TO INPUT CREDENTIALS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          TextFormField(
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
                            height: h * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: h * 0.065,
                              width: w * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                  child: Text(
                                "CONTINUE",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
