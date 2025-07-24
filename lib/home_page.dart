import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'promo_banner.dart';
import 'category_selector.dart';
import 'product_grid.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All Coffee';

  void _onCategorySelected(String category) {
    setState(() => selectedCategory = category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            expandedHeight: 250,
            pinned: false,
            floating: false,
            flexibleSpace: Stack(
              clipBehavior: Clip.none,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 32),
                  child: CustomAppBar(),
                ),
                const Positioned(
                  left: 5,
                  right: 5,
                  bottom: -70,
                  child: PromoBanner(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CategorySelector(
                    onCategorySelected: _onCategorySelected,
                    selected: selectedCategory,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ProductGrid(category: selectedCategory),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
} 