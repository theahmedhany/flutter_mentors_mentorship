import 'package:flutter/material.dart';

import '../models/order_manager.dart';
import '../widgets/add_order_tab.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/pending_orders_tab.dart';
import '../widgets/reports_tab.dart';

class AhwaManagerScreen extends StatefulWidget {
  const AhwaManagerScreen({super.key});

  @override
  State<AhwaManagerScreen> createState() => _AhwaManagerScreenState();
}

class _AhwaManagerScreenState extends State<AhwaManagerScreen> {
  final OrderManager orderManager = OrderManager();
  int selectedTab = 0;

  final List<String> tabTitles = ['Add Order', 'Pending Orders', 'Reports'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomTabBar(
            selectedIndex: selectedTab,
            tabs: tabTitles,
            onTabSelected: (index) => setState(() => selectedTab = index),
          ),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Row(
        children: [
          Icon(Icons.local_cafe, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Smart Ahwa Manager',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      backgroundColor: Colors.brown[700],
      elevation: 2,
      centerTitle: false,
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return AddOrderTab(
          orderManager: orderManager,
          onOrderAdded: () => setState(() {}),
        );
      case 1:
        return PendingOrdersTab(
          orderManager: orderManager,
          onOrderCompleted: () => setState(() {}),
        );
      case 2:
        return ReportsTab(orderManager: orderManager);
      default:
        return const SizedBox.shrink();
    }
  }
}
