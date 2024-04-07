// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medrecords/authentication/login_page.dart';
import 'package:medrecords/authentication/signup_page.dart';

import '../view/components/widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const route = 'welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 199, 180, 1.000),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 1.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(160, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30)),
                height: 240,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            "Keep Your \n Medical Records",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // fontStyle: FontStyle.italic,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: SizedBox(
                        width: 180,
                        child: AppButton(
                          txt: "Log In",
                          onTap: () {
                            Navigator.pushNamed(context, LoginPage.route);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        TextButton(
                            onPressed: (() {
                              Navigator.pushNamed(context, SignupPage.route);
                            }),
                            child: const Text(
                              "Sign Up Here",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffE41B27)),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            // const SizedBox(
            //   height: 1,
            // ),
          ],
        ),
      ),
    );
  }
}
