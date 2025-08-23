import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:fooddelivery/homeScreens/%20cart/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../ cart/cart_data.dart';
import '../ cart/cart_model.dart';

class DetailPage extends StatefulWidget {
  final Map<String, String> item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  int quantity = 1;

  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addToCart() {
    final String name = widget.item["name"] ?? "No Name";
    final String img = widget.item["img"] ?? "";
    final double price = double.tryParse(widget.item["price"] ?? "") ?? 0.0;

    cartItems.add(
      CartModel(
        name: name,
        img: img,
        quantity: quantity,
        price: price, // ✅ price is sent to cart
      ),
    );

    /// ✅ Using Top Snackbar
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "$quantity × $name added to cart (\$${(price * quantity).toStringAsFixed(2)})",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.item["name"] ?? "No Name";
    final String img = widget.item["img"] ?? "";
    final String desc = widget.item["desc"] ?? "No description available";
    final String price = widget.item["price"] ?? "0.0";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Food Details",
          style: GoogleFonts.bebasNeue(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // 👈 makes back button white
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF3E1F47),
              Color(0xFF0D7377),
            ],
            stops: [0.3, 1.0],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnim,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16)
                .copyWith(top: kToolbarHeight + 24, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circular Hero Image
                ScaleTransition(
                  scale: _scaleAnim,
                  child: Hero(
                    tag: name,
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      backgroundImage: img.isNotEmpty ? NetworkImage(img) : null,
                      child: img.isEmpty
                          ? const Icon(Icons.fastfood,
                          size: 80, color: Colors.white54)
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Name
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                ),

                // Price
                Text(
                  "\$${widget.item["price"] ?? "0.00"}",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),


                // Description
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    desc,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),

                // Quantity + Add to Cart
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() => quantity--);
                              }
                            },
                            icon: const Icon(Icons.remove_circle_outline,
                                color: Colors.white70),
                          ),
                          Text(
                            "$quantity",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() => quantity++);
                            },
                            icon: const Icon(Icons.add_circle_outline,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed: addToCart,
                        icon:
                        const Icon(Icons.shopping_cart, color: Colors.black),
                        label: Text(
                          "Add to Cart",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Ingredients
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.amberAccent),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ingredients",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _ingredientChip("🥬 Lettuce"),
                          _ingredientChip("🍅 Tomato"),
                          _ingredientChip("🧀 Cheese"),
                          _ingredientChip("🍔 Beef Patty"),
                          _ingredientChip("🥯 Bun"),
                          _ingredientChip("🧂 Seasoning"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ingredientChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amberAccent, width: 1),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: Colors.amberAccent,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
