import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/product_detail_page.dart';
import 'package:e_commerce_app/cart_page.dart';
import 'package:e_commerce_app/profile_page.dart';
import 'package:e_commerce_app/chat_list_page.dart';
import 'package:e_commerce_app/widgets/category_card.dart';
import 'package:e_commerce_app/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  // Warna utama dan field sesuai login page
  static const mainColor = Color(0xFF3A4D39); // Hijau gelap keabu-abuan
  static const fieldColor = Color(0xFFF5F6FA);

  // Dummy data produk (tema outfit/fashion)
  final List<Product> bestSellingProducts = [
    Product(
      id: '1',
      name: 'Summer T-Shirt',
      price: 29.99,
      image: 'assets/images/tshirt.webp',
      rating: 4.5,
      description: 'Comfortable cotton t-shirt for summer',
    ),
    Product(
      id: '2',
      name: 'Cool Jeans',
      price: 37.99,
      image: 'assets/images/jeans.jpeg',
      rating: 4.7,
      description: 'Comfortable cotton jeans for stylish looks',
    ),
    Product(
      id: '3',
      name: 'Shoes',
      price: 24.99,
      image: 'assets/images/shoes.jpg',
      rating: 4.5,
      description: 'Comfortable shoes for everyday wear',
    ),
    Product(
      id: '4',
      name: 'Watch',
      price: 29.99,
      image: 'assets/images/wacth.jpg',
      rating: 4.5,
      description: 'Trendy watch for your style',
    ),
    Product(
      id: '5',
      name: 'Hoodie',
      price: 39.99,
      image: 'assets/images/hoodie.webp',
      rating: 4.8,
      description: 'Warm hoodie for cold days',
    ),
    Product(
      id: '6',
      name: 'Sneakers',
      price: 49.99,
      image: 'assets/images/sneakers.webp',
      rating: 4.9,
      description: 'Trendy sneakers for your style',
    ),
    Product(
      id: '7',
      name: 'Cap',
      price: 14.99,
      image: 'assets/images/cap.webp',
      rating: 4.3,
      description: 'Cool cap for sunny days',
    ),
    Product(
      id: '8',
      name: 'Jacket',
      price: 59.99,
      image: 'assets/images/jacket.webp',
      rating: 4.7,
      description: 'Stylish jacket for all seasons',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey),
              const SizedBox(width: 4),
              const Text(
                "Bandung, ID",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: badges.Badge(
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: const Icon(Icons.shopping_cart, color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.only(bottom: 16, top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: fieldColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Outfit",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Banner Carousel
              SizedBox(
                height: 140,
                child: PageView(
                  children: [
                    _buildBanner(),
                    _buildBanner(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Category", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: mainColor)),
                  Text("See All", style: TextStyle(color: mainColor)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryCard(
                      title: 'Outfit',
                      icon: Icons.checkroom,
                      color: mainColor,
                    ),
                    CategoryCard(
                      title: 'Shoes',
                      icon: Icons.shopping_bag,
                      color: Colors.orange,
                    ),
                    CategoryCard(
                      title: 'Watch',
                      icon: Icons.watch,
                      color: Colors.blue,
                    ),
                    CategoryCard(
                      title: 'Jeans`',
                      icon: Icons.store,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Flash Sale Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Flash Sale", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: mainColor)),
                  Row(
                    children: [
                      const Text("Closing in : ", style: TextStyle(color: Colors.grey)),
                      _buildTimerBox("02"),
                      const Text(" : "),
                      _buildTimerBox("12"),
                      const Text(" : "),
                      _buildTimerBox("56"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TabBar(
                controller: _tabController,
                labelColor: mainColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Newest"),
                  Tab(text: "Popular"),
                  Tab(text: "Men"),
                ],
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              // Produk grid scrollable panjang
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bestSellingProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: bestSellingProducts[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: bestSellingProducts[index]),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        color: mainColor,
        buttonBackgroundColor: mainColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            // Favorite page (belum ada)
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner_outfit.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 24,
            top: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "New Collection",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  "Discount 50% for the first transaction",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(mainColor),
                  ),
                  child: Text(
                    "Shop Now",
                    style: TextStyle(color: fieldColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBox(String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}