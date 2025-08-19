import 'package:flutter/material.dart';
import 'package:fooddelivery/OnBoarding%20Screens/forget.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: SingleChildScrollView(
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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

              // "Login" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Glass container with form
              Padding(
                padding: const EdgeInsets.all(20),
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
                        const SizedBox(height: 15),

                        // Email/Username
                        TextField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Email or Username",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white54),
                            ),
                          ),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 12),

                        // Password
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white54),
                            ),
                          ),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 20),

                        // Login button
                        InkWell(
                          onTap: () {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();

                            if (email.isNotEmpty && password.isNotEmpty) {
                              // Example: Successful login
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message: "✅ Login successful!",
                                ),
                              );
                            } else {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.error(
                                  message: "❌ Please enter email & password",
                                ),
                              );
                            }
                          },
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
                                "Login",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Forgot password link
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 450),
                                  child: const ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                color: Colors.white,
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

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
