import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363D49),
      appBar: AppBar(
        title: Text(
          "My Account",
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          Column(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/download.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "A3 Solutions",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // GENERAL SECTION
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SectionTitle("General"),
          ),
          const SizedBox(height: 12),
          GlassListTile(
            icon: Icons.account_circle,
            title: "Account",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("Account Page")),
              // );
            },
          ),
          const SizedBox(height: 10),
          GlassListTile(
            icon: Icons.shopping_bag_outlined,
            title: "Recent Orders",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("Recent Orders Page")),
              // );
            },
          ),
          const SizedBox(height: 10),
          GlassListTile(
            icon: Icons.location_on_rounded,
            title: "My Addresses",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("My Addresses Page")),
              // );
            },
          ),

          const SizedBox(height: 28),

          // SUPPORT SECTION
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SectionTitle("Support"),
          ),
          const SizedBox(height: 12),
          GlassListTile(
            icon: Icons.help,
            title: "Help & Support",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("Help & Support Page")),
              // );
            },
          ),
          const SizedBox(height: 12),
          GlassListTile(
            icon: Icons.contact_page_outlined,
            title: "Terms & Conditions",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("Terms & Conditions Page")),
              // );
            },
          ),
          const SizedBox(height: 10),
          GlassListTile(
            icon: Icons.star,
            title: "Rate App",
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (_) => const DummyPage("Rate App Page")),
              // );
            },
          ),

          const SizedBox(height: 28),

          // LOGOUT BUTTON
          InkWell(
            onTap: () {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "✅ Logged out successfully!",
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Colors.redAccent, Colors.red],
                ),
              ),
              child: Center(
                child: Text(
                  "Logout",
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
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white70,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Glass ListTile
class GlassListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const GlassListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 👈 makes it clickable
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ).asGlass(
        tintColor: Colors.white,
        clipBorderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

