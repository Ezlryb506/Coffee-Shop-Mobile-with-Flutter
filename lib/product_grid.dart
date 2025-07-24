import 'package:flutter/material.dart';
import 'detail_page.dart';

class ProductGrid extends StatelessWidget {
  final String category;
  const ProductGrid({super.key, this.category = 'All Coffee'});

  static const List<Map<String, dynamic>> products = [
    {
      'name': 'Caffe Mocha',
      'type': 'Deep Foam',
      'price': 4530,
      'image': 'assets/images/Mocha.png',
      'rating': 4.8,
      'description': 'Caffe Mocha adalah perpaduan espresso, coklat, dan susu yang creamy, cocok untuk pecinta kopi dan coklat.',
    },
    {
      'name': 'Flat White',
      'type': 'Espresso',
      'price': 3530,
      'image': 'assets/images/Latte.png',
      'rating': 4.6,
      'description': 'Flat White adalah espresso dengan microfoam, menghasilkan rasa kopi yang kuat namun lembut.',
    },
    {
      'name': 'Caramel Machiato',
      'type': 'Machiato',
      'price': 5000,
      'image': 'assets/images/Cappuccino.png',
      'rating': 4.7,
      'description': 'Caramel Machiato adalah espresso dengan susu dan sirup karamel, manis dan creamy.',
    },
    {
      'name': 'Vanilla Machiato',
      'type': 'Machiato',
      'price': 5200,
      'image': 'assets/images/Mocha.png',
      'rating': 4.5,
      'description': 'Vanilla Machiato adalah espresso dengan susu dan sirup vanilla, lembut dan harum.',
    },
    {
      'name': 'Classic Latte',
      'type': 'Latte',
      'price': 4000,
      'image': 'assets/images/Latte.png',
      'rating': 4.9,
      'description': 'Classic Latte adalah espresso dengan banyak susu steamed, creamy dan ringan.',
    },
    {
      'name': 'Hazelnut Latte',
      'type': 'Latte',
      'price': 4300,
      'image': 'assets/images/Cappuccino.png',
      'rating': 4.6,
      'description': 'Hazelnut Latte adalah latte dengan tambahan sirup hazelnut, aroma kacang yang khas.',
    },
    {
      'name': 'Iced Americano',
      'type': 'Americano',
      'price': 3700,
      'image': 'assets/images/Mocha.png',
      'rating': 4.4,
      'description': 'Iced Americano adalah espresso yang disajikan dengan air dingin dan es, segar dan ringan.',
    },
    {
      'name': 'Classic Americano',
      'type': 'Americano',
      'price': 3500,
      'image': 'assets/images/Latte.png',
      'rating': 4.3,
      'description': 'Classic Americano adalah espresso dengan tambahan air panas, rasa kopi yang clean.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = category == 'All Coffee'
        ? products
        : products.where((p) => p['type'].toString().toLowerCase() == category.toLowerCase()).toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, i) {
        final p = filtered[i];
        return ProductCard(
          name: p['name'],
          type: p['type'],
          price: p['price'],
          image: p['image'],
          rating: p['rating'],
          description: p['description'],
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name, type, image, description;
  final int price;
  final double rating;
  const ProductCard({
    super.key,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                name: name,
                type: type,
                image: image,
                rating: rating,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.brown,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        child: Image(
                          width: double.infinity,
                          height: double.infinity,
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(45, 0, 0, 0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Color.fromARGB(255, 245, 172, 16), size: 14),
                            const SizedBox(width: 2),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 41, 34, 32),
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      type,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 0),
                    Row(
                      children: [
                        Text(
                          ' \$ ${price / 1000}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 20, 16, 14),
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: const Color(0xFFD17B4A),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              //
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.add, color: Colors.white, size: 20),
                            ),
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
    );
  }
}