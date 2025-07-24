import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedLocation = 'Bilzen, Tanjungbalai';
  final List<String> locations = [
    'Bilzen, Tanjungbalai',
    'Medan',
    'Jakarta',
    'Surabaya',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
              color: Color.fromARGB(206, 167, 164, 164),
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLocation,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 138, 136, 136),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  dropdownColor: Colors.black,
                  items: locations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(color: Color.fromARGB(255, 211, 210, 210))),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 32, 31, 31),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search coffee',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.white38),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Material(
                color: const Color.fromARGB(255, 209, 123, 74),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: Colors.brown,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Icon(Icons.tune, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
