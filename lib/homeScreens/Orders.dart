import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF3E1F47), // top-left to center
              Color(0xFF0D7377), // bottom-right to center
            ],
            stops: [0.3, 1.0],
          ),
        ),
        child: Center(
          child: Text(
            "🛒 Orders Page",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }
}
