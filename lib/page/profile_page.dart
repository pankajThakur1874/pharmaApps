import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF20df6c);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // App Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 28),
                ),
                Expanded(
                  child: Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                const SizedBox(width: 40), // balance spacing
              ],
            ),
          ),

          // Profile header
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 64,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuAn77ePPkVsOm2Ne3SBWfzA8-t7KketKWoGysdLdXhliyXncabKu7bYDbbkM7oeSuX5EKevKR9IryAb12cw4N-x4tNC7cZqNu1pRJSCLoJVp7e56g_QwQg8Q5C0un5JptXskUdRDUWz70K28i-PyuPeFnsvZZRms6J9a5wbebsBCEPkJ9YiPUgrVPVbdFznCuZa-raJeJ7SOB6SETHhpCQuHRVTRCNgUh3Q0dyrk0WHCzVEboH1wuZe-SXSSzyqEW7L4v1Wh34_FMg",
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Sophia Clark",
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          Text(
            "sophia.clark@email.com",
            style: GoogleFonts.notoSans(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle("Personal Details"),
                  sectionCard([
                    listTile("Name", "Sophia Clark"),
                    listTile("Address", "123 Main Street, Anytown"),
                    listTile("Mobile Number", "+1 (555) 123-4567"),
                  ]),

                  sectionTitle("Order History"),
                  sectionCard([
                    simpleTile("View Past Orders"),
                  ]),

                  sectionTitle("Admin View"),
                  sectionCard([
                    ListTile(
                      leading: const Icon(Icons.receipt_long, color: Colors.grey),
                      title: Text("All Orders",
                          style: GoogleFonts.notoSans(fontSize: 16)),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {},
                    ),
                  ]),

                  sectionTitle("Settings"),
                  sectionCard([
                    // Notifications with toggle
                    SwitchListTile(
                      value: notificationsEnabled,
                      onChanged: (val) {
                        setState(() {
                          notificationsEnabled = val;
                        });
                      },
                      title: Text("Notifications",
                          style: GoogleFonts.notoSans(fontSize: 16)),
                      activeColor: primaryColor,
                    ),
                    simpleTile("Language", trailing: "English"),
                    simpleTile("Help Center"),
                    simpleTile("About"),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Nav
      // ✅ Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF20df6c),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Helpers
  Widget sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 8, left: 8),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey[900],
      ),
    ),
  );

  Widget sectionCard(List<Widget> children) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Column(children: children),
  );

  Widget listTile(String title, String subtitle) => ListTile(
    title: Text(title,
        style: GoogleFonts.notoSans(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[900])),
    subtitle: Text(subtitle,
        style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[600])),
    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    onTap: () {},
  );

  Widget simpleTile(String title, {String? trailing}) => ListTile(
    title: Text(title, style: GoogleFonts.notoSans(fontSize: 16)),
    trailing: trailing != null
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(trailing, style: GoogleFonts.notoSans(color: Colors.grey)),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    )
        : const Icon(Icons.chevron_right, color: Colors.grey),
    onTap: () {},
  );
}