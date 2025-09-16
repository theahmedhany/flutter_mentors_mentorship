import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabs;
  final Function(int) onTabSelected;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Row(
        children: tabs
            .asMap()
            .entries
            .map(
              (entry) => Expanded(
                child: _buildTabButton(
                  entry.key,
                  entry.value,
                  selectedIndex == entry.key,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTabButton(int index, String title, bool isSelected) {
    return TextButton(
      onPressed: () => onTabSelected(index),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.brown[700] : Colors.brown[300],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
