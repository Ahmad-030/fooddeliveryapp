import 'package:flutter/material.dart';
import 'package:fooddelivery/homeScreens/checkout/delivery_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'cart_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _scaleAnim = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.elasticOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity > 0) {
        cartItems[index].quantity = newQuantity;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
          child: SlideTransition(
            position: _slideAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  // Progress Indicator
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        _buildStepIndicator(0, 'Cart', true),
                        Expanded(child: _buildProgressLine(false)),
                        _buildStepIndicator(1, 'Delivery', false),
                        Expanded(child: _buildProgressLine(false)),
                        _buildStepIndicator(2, 'Payment', false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: cartItems.isEmpty
                        ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shopping_cart_outlined,
                              size: 80, color: Colors.white30),
                          const SizedBox(height: 16),
                          Text(
                            "Your cart is empty 😔",
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                        : ListView.builder(
                      itemCount: cartItems.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color:
                                Colors.amberAccent.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color:
                                      Colors.white.withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: item.img.isNotEmpty
                                        ? Image.network(
                                      item.img,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error,
                                          stackTrace) =>
                                      const Icon(
                                        Icons.restaurant,
                                        color: Colors.amberAccent,
                                        size: 40,
                                      ),
                                    )
                                        : const Icon(
                                      Icons.restaurant,
                                      color: Colors.amberAccent,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.amberAccent,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Price: \$ ${item.price}", // ✅ show actual menu price
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Total: \$ ${(item.price * item.quantity)}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.greenAccent,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Quantity Controls
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.amberAccent
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _updateQuantity(
                                              index, item.quantity - 1);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        constraints:
                                        const BoxConstraints(
                                          minWidth: 36,
                                          minHeight: 36,
                                        ),
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.amberAccent,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _updateQuantity(
                                              index, item.quantity + 1);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        constraints:
                                        const BoxConstraints(
                                          minWidth: 36,
                                          minHeight: 36,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  if (cartItems.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        border: Border(
                          top: BorderSide(
                            color: Colors.amberAccent.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Items: $totalItems",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Subtotal: \$ ${totalPrice}",
                                    style: GoogleFonts.poppins(
                                      color: Colors.amberAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Free Delivery",
                                    style: GoogleFonts.poppins(
                                      color: Colors.greenAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 8,
                                shadowColor: Colors.amberAccent.withOpacity(0.4),
                              ),
                              onPressed: cartItems.isEmpty ? null : () {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  CustomSnackBar.success(
                                    message: "Proceeding to Delivery 🚚",
                                    backgroundColor: Colors.greenAccent.shade400,
                                  ),
                                );

                                Future.delayed(const Duration(milliseconds: 800), () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DeliveryDetailsPage(
                                        cartItems: cartItems.map((item) => {
                                          'name': item.name,
                                          'price': item.price,
                                          'quantity': item.quantity,
                                          'image': item.img,
                                        }).toList(),
                                        subtotal: totalPrice,
                                      ),
                                    ),
                                  );
                                });
                              },
                              child: Text(
                                "Continue to Delivery (PKR ${totalPrice})",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int step, String label, bool isActive) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isActive ? Colors.amberAccent : Colors.white.withOpacity(0.3),
            shape: BoxShape.circle,
            border: Border.all(
              color:
              isActive ? Colors.amberAccent : Colors.white.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: isActive
              ? const Icon(Icons.check, color: Colors.black, size: 16)
              : Text(
            '${step + 1}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: isActive ? Colors.amberAccent : Colors.white70,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.amberAccent : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
