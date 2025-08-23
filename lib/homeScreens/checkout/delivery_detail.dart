import 'package:flutter/material.dart';
import 'package:fooddelivery/homeScreens/checkout/orderSucess.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DeliveryDetailsPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double subtotal;

  const DeliveryDetailsPage({
    Key? key,
    required this.cartItems,
    required this.subtotal,
  }) : super(key: key);

  @override
  _DeliveryDetailsPageState createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: 'Ahmad Ali');
  final TextEditingController emailController = TextEditingController(text: 'ahmad.ali@gmail.com');
  final TextEditingController phoneController = TextEditingController(text: '03001234567');
  final TextEditingController addressController = TextEditingController(text: 'House 123, Street 45, Gulberg III, Lahore');

  String selectedCity = 'Lahore';
  String selectedCountryCode = '+92';

  List<String> pakistaniCities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Faisalabad',
    'Multan',
    'Peshawar',
    'Quetta',
    'Sialkot',
    'Gujranwala'
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnim = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delivery Details",
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
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
            child: Column(
              children: [
                const SizedBox(height: 100),

                // Progress Indicator
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      _buildStepIndicator(0, 'Cart', true),
                      Expanded(child: _buildProgressLine(true)),
                      _buildStepIndicator(1, 'Delivery', true),
                      Expanded(child: _buildProgressLine(false)),
                      _buildStepIndicator(2, 'Payment', false),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Personal Details Section
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.amberAccent.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person_outline, color: Colors.amberAccent),
                                    SizedBox(width: 8),
                                    Text(
                                      'Personal Details',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 24),

                                // Full Name
                                _buildFormField(
                                  label: 'Full Name',
                                  controller: nameController,
                                  prefixIcon: Icons.person_outline,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your full name';
                                    }
                                    return null;
                                  },
                                ),

                                SizedBox(height: 20),

                                // Email Address
                                _buildFormField(
                                  label: 'Email Address',
                                  controller: emailController,
                                  prefixIcon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),

                                SizedBox(height: 20),

                                // Phone Number
                                Text(
                                  'Phone Number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: GoogleFonts.poppins(color: Colors.white),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your phone number',
                                    hintStyle: GoogleFonts.poppins(color: Colors.white54),
                                    prefixIcon: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('🇵🇰', style: TextStyle(fontSize: 18)),
                                          SizedBox(width: 4),
                                          Text(
                                            selectedCountryCode,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.amberAccent,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.redAccent),
                                    ),
                                    errorStyle: GoogleFonts.poppins(color: Colors.redAccent),
                                  ),
                                ),

                                SizedBox(height: 20),

                                // Delivery Address
                                Text(
                                  'Delivery Address',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextFormField(
                                  controller: addressController,
                                  maxLines: 3,
                                  style: GoogleFonts.poppins(color: Colors.white),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your delivery address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your complete address',
                                    hintStyle: GoogleFonts.poppins(color: Colors.white54),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Icon(Icons.location_on_outlined, color: Colors.amberAccent),
                                    ),
                                    filled: true,
                                    fillColor: Colors.black.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.redAccent),
                                    ),
                                    errorStyle: GoogleFonts.poppins(color: Colors.redAccent),
                                  ),
                                ),

                                SizedBox(height: 20),

                                // City Selection
                                Text(
                                  'City',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.amberAccent.withOpacity(0.3),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedCity,
                                      isExpanded: true,
                                      dropdownColor: Colors.black87,
                                      style: GoogleFonts.poppins(color: Colors.white),
                                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.amberAccent),
                                      items: pakistaniCities.map((String city) {
                                        return DropdownMenuItem<String>(
                                          value: city,
                                          child: Row(
                                            children: [
                                              Text('🇵🇰'),
                                              SizedBox(width: 12),
                                              Text(
                                                city,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedCity = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Order Summary
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.amberAccent.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Summary',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal (${widget.cartItems.length} items)',
                                      style: GoogleFonts.poppins(color: Colors.white70),
                                    ),
                                    Text(
                                      'PKR ${widget.subtotal}',
                                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery Fee',
                                      style: GoogleFonts.poppins(color: Colors.white70),
                                    ),
                                    Text(
                                      'FREE',
                                      style: GoogleFonts.poppins(
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Service Fee',
                                      style: GoogleFonts.poppins(color: Colors.white70),
                                    ),
                                    Text(
                                      'PKR 25.99',
                                      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Divider(height: 24, color: Colors.amberAccent.withOpacity(0.3)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'PKR ${(widget.subtotal + 25.99)}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
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

                // Bottom Navigation
                Container(
                  padding: EdgeInsets.all(20),
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
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Show Top SnackBar before navigating
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.success(
                              message: "Order placed successfully 🎉",
                              backgroundColor: Colors.greenAccent.shade400,
                            ),
                          );

                          // Navigate after a short delay
                          Future.delayed(const Duration(milliseconds: 800), () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OrderSuccessPage(
                                  orderTotal: widget.subtotal + 25,
                                  customerName: nameController.text,
                                  customerEmail: emailController.text,
                                  customerCity: selectedCity,
                                ),
                              ),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: Colors.amberAccent.withOpacity(0.4),
                      ),
                      child: Text(
                        'Place Order (PKR ${(widget.subtotal + 25.99)})',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
              color: isActive ? Colors.amberAccent : Colors.white.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: isActive
              ? Icon(Icons.check, color: Colors.black, size: 16)
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
        SizedBox(height: 8),
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
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.amberAccent : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.poppins(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter your ${label.toLowerCase()}',
            hintStyle: GoogleFonts.poppins(color: Colors.white54),
            prefixIcon: Icon(prefixIcon, color: Colors.amberAccent),
            filled: true,
            fillColor: Colors.black.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.amberAccent.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.amberAccent, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            errorStyle: GoogleFonts.poppins(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}