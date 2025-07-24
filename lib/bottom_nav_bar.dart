import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = [
      Icons.home,
      Icons.favorite_border,
      Icons.shopping_bag_outlined,
      Icons.notifications_none_outlined,
    ];
    const selectedIndex = 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(45, 121, 85, 72),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(navItems.length, (i) {
              return NavBarItem(
                icon: navItems[i],
                selected: i == selectedIndex,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const NavBarItem({required this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // TODO: Navigasi antar halaman
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selected ? const Color.fromARGB(255, 209, 123, 74) : Colors.brown,
                size: 28,
              ),
              const SizedBox(height: 4),
              DotIndicator(selected: selected),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool selected;
  const DotIndicator({required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: selected ? 12 : 8,
      height: 4,
      decoration: BoxDecoration(
        color: selected ? const Color.fromARGB(255, 209, 123, 74) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
