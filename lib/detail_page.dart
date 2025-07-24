import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String type;
  final String image;
  final double rating;
  final int price;
  final String description;
  const DetailPage({
    super.key,
    required this.name,
    required this.type,
    required this.image,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String selectedSize = 'M';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    final priceText = '\$ ${(widget.price / 1000).toStringAsFixed(2)}';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('Detail', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.brown),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.brown),
              onPressed: () {},
              splashRadius: 24,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                widget.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.type,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color.fromARGB(255, 245, 172, 16), size: 20),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(' (230)', style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const Spacer(),
                    Icon(Icons.delivery_dining, color: Colors.brown, size: 22), // Motor delivery
                    const SizedBox(width: 8),
                    Icon(Icons.coffee, color: Colors.brown, size: 22), // Biji kopi
                    const SizedBox(width: 8),
                    Icon(Icons.thermostat, color: Colors.brown, size: 22), // Termos
                  ],
                ),
                // Garis pemisah dengan color dan shadow untuk estetika
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 8, 7, 7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 6),
                Builder(
                  builder: (context) {
                    final desc = widget.description;
                    if (desc.length < 70) {
                      return Text(desc, style: const TextStyle(color: Colors.black87, fontSize: 15));
                    }
                    return RichText(
                      text: TextSpan(
                        text: readMore ? desc : '${desc.substring(0, 70)}... ',
                        style: const TextStyle(color: Colors.black87, fontSize: 15),
                        children: [
                          if (!readMore)
                            TextSpan(
                              text: 'Read More',
                              style: const TextStyle(color: Color.fromARGB(255, 209, 123, 74), fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => setState(() => readMore = true),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 18),
                const Text(
                  'Size',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: ['S', 'M', 'L'].map((size) {
                    final isSelected = selectedSize == size;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: OutlinedButton(
                        onPressed: () => setState(() => selectedSize = size),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isSelected ? const Color.fromARGB(255, 248, 230, 218) : Colors.white,
                          side: BorderSide(color: isSelected ? const Color.fromARGB(255, 209, 123, 74) : Colors.brown[100]!),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: isSelected ? 2 : 0,
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: isSelected ? const Color.fromARGB(255, 209, 123, 74) : Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: const Color.fromARGB(64, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  priceText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 165, 98, 73),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 209, 123, 74),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: Colors.brown,
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 