import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for medicines",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // ✅ Promo Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF20df6c),
                        shape: StadiumBorder(),
                      ),
                      child: const Text("Order Now"),
                    )
                  ],
                ),
              ),
            ),

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
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuDaIBGnzQKHfq5yfb7jo3wJIBJ2i-IRC1kRh4vRbio8He-jc4RLBDdQ4v5A5yCWen6KjP7_AduFf9L85ipGwMttv4SBRbssYbIUINI3aKHPfKjALvZoAlSizBmwdSiwmXSalhPyGWV2Ss61u7gA-n4SsUJxyVVsu2lp-9T5ngPct9RY7Y8Wjy9vPC8i1IRjrrnQXr1M0NzQiRL6lDSEpScKju4u2-t5kfXkMFEX4FGGYWJ7gzEgkJUW2LeUAvydERf5Cji_IEW-ZN8"),
                  _FeaturedCard(
                      title: "Allergy Relief",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuB4QHWbrJxQ85TZhyTYTyQBENvHRkOqSqZ0EER7tJv54TUvOfcFj9S7h_7P8qprOXMdGPbAy-FykMNfqvsajCRNbnlzkqxBUHq4hNZ5pKrSIahapWhOJ5HbRKkikYHTaZdXoCFhUYkTkKUq14cwfW_KuRyy5BsNW3Bs4ORkpFFFRrgEXUiWGMugMGq-X239crzrxuyFn86isJaZAcfa2dWZmVG0ZghZeUDDcE4sH7z4k5EwG3rpGTaMGUsXWaJkXrZ_MhvyZbAGXf4"),
                  _FeaturedCard(
                      title: "Cold & Flu",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuBP-Zsbus7rXGpL0ifBvq4-Ggnx98lICVsB4P6mjfDZaMrCdL_jdI_72S1n4LGLFLYyM4-W8fBKzG804M0jdPivJMJ6Qy5Z21r9r5tMEQW1sTBeva0Ir9f2OhrTvL4OcydqQ4uM8bjAoJmHlJxBNRhgbeXMKTVIwBlc1TMndqN-ZVw9MgihKf7bUnkYNfgTbmTbsUyuwY10D6GfNRExB_77P09JQ660lbdbd8I_7r_LaNB0DwGALMkpqQ640bx5lW6ycU5MxH7FHiw"),
                ],
              ),
            ),

            // ✅ Categories Section
            _sectionTitle("Categories"),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(12),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  _CategoryCard(
                      title: "Pain Relief",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuA3jMwzFQazEGrOm0Pa957UuXCSWZBZZQadlG0Pc2z8JB1Kv_xzk1o-3kg-H3d2eyVe8GteJ3ZEJIbxfOScegUa_HimwbX7VmD_wfLp45lxLX7ItuBPBk0Z8ZVSqw1Xb6YVPSToElTZJdcEtufzh8ox1cZ-B08pKJQNCaj9MX_EGtT7-7iFllA14-45XHe4vEe-QMb0vt0HebJXxegpZwPORRb1Ga2zP_Unsj5esE4Rvgjtcz4TNUwxMrPUtCEowO-3J_wujoSJQsE"),
                  _CategoryCard(
                      title: "Allergy Relief",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuBYTBEy5f1G3TFWsNsQKvQpp9uuM9QRyblwhVBToHhQy_EodPhUiJphwUU42-06KnWyuJRZcmeD_UNPuKf0lxJEVWng_O0FRBdJCgX7KdSseQYr8zhy2n5pJ_VvVnNundZMXiETjiO85_mG2kON_ei4lqqwaMizE_19DUrgSZwSeNJF2PFaKXk5hCZy53SdXaAv1wEZLQfRKShVpI5Oqk9-REG78El9pX1LhXiCyVlQk099YF0-iNZ-Wzv8ih7D5V23Ag9S7F5FZBk"),
                  _CategoryCard(
                      title: "Cold & Flu",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuBqBeqrJLWQ9P7IUewMghj9_NZo-QiRSdEVfTvyUfBvzAi8VFQrenX1lVmHVSvQdZb8Gyj75di39cd8rkYQAuhYuQaiplqKcYEb5CZDr6XZogayuyvisbxiQTR7gz_qQE2INR9xyjNShEFUNA8-QuoruARnXIjBI1uO_KcKsKGUOmImevgP_SILB2gsNRPyaqpqPXJsmTYAK6tDO6HrLZLoOBuBedeu7c9PGqddSmR0v9DmLzEeH39k4ArhFszAALLbNwCGoOn1jEo"),
                  _CategoryCard(
                      title: "Vitamins",
                      imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuCFK_uEU-_B7gAZSHH7bZlSLRZDsOVGk48P5Pu-x5i0JfOYH2-Rj7Mpcp0dYk6YStBTLfIxr2ijy1S1PJzkJ2dCXKrDQR-z99S1LOyQkOFAKd0z-rxOcukWxY6sqvswJsXkQHlYN14UJqdUcgjIuiDkTRr6ha8hEuyTgWKOPqtXLrYDb_rt3JHl5Ux2qVIZ1LZhfvzYIpIL23AmI9iEeziTC1QAG4qa-qSm-LgWuPJq9gU7ryXkpBjW2_NCWWRh0owczwjfyTYWLEE"),
                ],
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF20df6c),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Products"),
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
              style:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
            child: Image.network(imageUrl, height: 40, width: 40, fit: BoxFit.cover),
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