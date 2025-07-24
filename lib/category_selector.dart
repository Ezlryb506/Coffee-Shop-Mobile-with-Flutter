import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final void Function(String category)? onCategorySelected;
  final String selected;
  const CategorySelector({
    super.key,
    required this.onCategorySelected,
    required this.selected,
  });

  static const categories = ['All Coffee', 'Machiato', 'Latte', 'Americano'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final isSelected = categories[i] == selected;
          return GestureDetector(
            onTap: () {
              if (onCategorySelected != null) {
                onCategorySelected!(categories[i]);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD17B4A) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
                border: Border.all(
                  color: isSelected ? const Color(0xFFD17B4A) : Colors.brown[100]!,
                  width: 1.5,
                ),
              ),
              child: Text(
                categories[i],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.brown[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
