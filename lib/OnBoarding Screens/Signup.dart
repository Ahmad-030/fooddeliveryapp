import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

              // "Sign Up" text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 0),

              // Glass container with form
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
                        const SizedBox(height: 15),

                        // Username
                        TextField(
                          controller: usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration("Username"),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 12),

                        // Number
                        TextField(
                          controller: numberController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration("Number"),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 12),

                        // Email
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration("Email"),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 12),

                        // Password
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration("Password"),
                        ).asGlass(blurX: 10, blurY: 10, tintColor: Colors.black),

                        const SizedBox(height: 20),

                        // Create Account button
                        InkWell(
                          onTap: () {
                            final username = usernameController.text.trim();
                            final number = numberController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (username.isEmpty ||
                                number.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty) {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.error(
                                  message: "⚠️ Please fill in all fields.",
                                ),
                              );
                            } else {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message:
                                  "🎉 Account created successfully! Welcome 🚀",
                                ),
                              );

                              // Example navigation
                              // Navigator.pushReplacementNamed(context, '/home');
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
                                "Create Account",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ).asGlass(blurX: 5, blurY: 5, tintColor: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Input Decoration
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.black.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white54),
      ),
    );
  }
}
