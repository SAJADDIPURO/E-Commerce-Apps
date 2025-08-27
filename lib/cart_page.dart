import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';


// Jika sudah ada CartManager global, ganti cartItems di bawah dengan CartManager.cart
class CartItem {
  final Product product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Dummy cart, ganti dengan cart global jika sudah ada
  final List<CartItem> cartItems = [
    CartItem(
      product: Product(
        id: '1',
        name: 'Summer T-Shirt',
        price: 29.99,
        image: 'assets/images/tshirt.webp',
        rating: 4.5,
        description: 'Comfortable cotton t-shirt for summer',
      ),
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: '2',
        name: 'Cool Jeans',
        price: 37.99,
        image: 'assets/images/jeans.jpeg',
        rating: 4.7,
        description: 'Comfortable cotton jeans for stylish looks',
      ),
      quantity: 2,
    ),
  ];

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF3A4D39);
    const fieldColor = Color(0xFFF5F6FA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "\nCart List",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            height: 1.1,
          ),
        ),
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
      ),  
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item.product.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$ ${item.product.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            // Tombol tambah
                            InkWell(
                              onTap: () {
                                setState(() {
                                  item.quantity++;
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.add, color: Colors.white, size: 20),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Jumlah
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: mainColor, width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.quantity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Tombol kurang
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (item.quantity > 1) {
                                    item.quantity--;
                                  }
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.remove, color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: fieldColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.discount_outlined, color: Colors.black54, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Do you have any discount code?",
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal", style: TextStyle(fontSize: 16, color: Colors.black)),
                Text("\$ ${subtotal.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(thickness: 1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "\$ ${subtotal.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Fungsi checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}