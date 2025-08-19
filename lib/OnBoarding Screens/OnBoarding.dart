import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

// Import your login and signup screens
import 'login.dart';
import 'signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top title
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Text(
                  "App Name",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Bottom glass container with buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0,left: 10,right: 10),
              child: Center(
                child: Container(
                  height: 180,
                  width: 340,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blueGrey.withOpacity(0.1),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Login button
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRightWithFade, // you can change to rightToLeft, leftToRight, scale, etc.
                              duration: const Duration(milliseconds: 550), // animation speed
                              child: const Login(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                      const SizedBox(height: 15),

                      // Sign Up button
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade, // or fade / scale / rotate
                              duration: const Duration(milliseconds: 550), // adjust speed
                              child: const Signup(),
                            ),
                          );

                        },
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),
                    ],
                  ),
                ).asGlass(
                  blurX: 5,
                  blurY: 5,
                  tintColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
