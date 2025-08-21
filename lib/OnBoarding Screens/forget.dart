import 'package:flutter/material.dart';
import 'package:fooddelivery/SettingScreen/profiledrawer.dart';
import 'package:fooddelivery/homeScreens/BOTTOMNAV.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    // Navigator.push(
    //   context,
    //   PageTransition(
    //     type: PageTransitionType.fade, // or fade / scale / rotate
    //     duration: const Duration(milliseconds: 550), // adjust speed
    //     child: const Home(),
    //   ),
    // );
    final email = _emailController.text.trim();

    if (email.isEmpty || !email.contains("@")) {
      final overlay = Overlay.of(context);
      if (overlay != null) {
        showTopSnackBar(
          overlay,
          const CustomSnackBar.error(
            message: "⚠️ Please enter a valid email address",
          ),
        );
      }
      return;
    }

    // TODO: Add your backend reset password API call here
    final overlay = Overlay.of(context);
    if (overlay != null) {
      showTopSnackBar(
        overlay,
        CustomSnackBar.success(
          message: "📩 Reset link sent to $email",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Back arrow
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // App Name
              Center(
                child: Text(
                  "App Name",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // "Forgot Password" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Glass container
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    width: 340,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey.withOpacity(0.1),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),

                        // Email input
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white54),
                            ),
                          ),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),
                        const SizedBox(height: 25),

                        // Reset Password button
                        InkWell(
                          onTap: _resetPassword,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [Colors.blueAccent, Colors.lightBlue],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Reset Password",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
