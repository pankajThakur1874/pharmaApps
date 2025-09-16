import 'package:flutter/material.dart';
import 'profile_page.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // start offscreen left
      end: Offset.zero, // final position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward(); // play animation when widget loads
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity, // ✅ Full screen width
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.green, Color(0xFF20df6c)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Get 25% OFF",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.white)),
              const SizedBox(height: 6),
              const Text("on your first order!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 6),
              const Text("Use code: WELCOME25",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // 👉 Handle Order Now button
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Redirect to Orders Page")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF20df6c),
                  shape: const StadiumBorder(),
                ),
                child: const Text("Order Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Pain Relief", "imageUrl": "https://picsum.photos/100?random=4"},
      {"title": "Allergy Relief", "imageUrl": "https://picsum.photos/100?random=5"},
      {"title": "Cold & Flu", "imageUrl": "https://picsum.photos/100?random=6"},
      {"title": "Vitamins", "imageUrl": "https://picsum.photos/100?random=7"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80), // space for bottom nav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Top AppBar
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(Icons.menu),
                    const Text(
                      "Medication",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    _circleIcon(Icons.shopping_cart),
                  ],
                ),
              ),

              // ✅ Search Bar
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for medicines",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // ✅ Promo Banner
              PromoBanner(),

              // ✅ Featured Section
              _sectionTitle("Featured"),
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: const [
                    _FeaturedCard(
                        title: "Pain Relief",
                        imageUrl:
                        "https://picsum.photos/200/100?random=1"),
                    _FeaturedCard(
                        title: "Allergy Relief",
                        imageUrl:
                        "https://picsum.photos/200/100?random=2"),
                    _FeaturedCard(
                        title: "Cold & Flu",
                        imageUrl:
                        "https://picsum.photos/200/100?random=3"),
                  ],
                ),
              ),

              // ✅ Categories Section
              _sectionTitle("Categories"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(), // disable grid scroll
                  shrinkWrap: true, // fit inside parent scroll
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _CategoryCard(
                      title: category["title"]!,
                      imageUrl: category["imageUrl"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF20df6c),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 3) {
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

  // Helper for top icons
  Widget _circleIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black87),
    );
  }

  // Helper for section titles
  static Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold)),
    ),
  );
}

// ✅ Featured Card Widget
class _FeaturedCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const _FeaturedCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl,
                height: 90, width: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// ✅ Category Card Widget
class _CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const _CategoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl,
                height: 40, width: 40, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}