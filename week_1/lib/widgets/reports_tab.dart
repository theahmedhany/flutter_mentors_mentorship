import 'package:flutter/material.dart';

import '../models/order_manager.dart';

class ReportsTab extends StatelessWidget {
  final OrderManager orderManager;

  const ReportsTab({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final salesCount = orderManager.getDrinkSalesCount();
    final totalRevenue = orderManager.getTotalRevenue();
    final totalOrders = orderManager.getTotalOrdersCount();
    final completedOrders = orderManager.getCompletedOrdersCount();
    final pendingOrders = orderManager.getPendingOrdersCount();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryCards(
            totalOrders,
            completedOrders,
            pendingOrders,
            totalRevenue,
          ),
          const SizedBox(height: 20),
          _buildSalesAnalytics(salesCount),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(
    int totalOrders,
    int completedOrders,
    int pendingOrders,
    double totalRevenue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Total Orders',
                totalOrders.toString(),
                Icons.receipt_long,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Completed',
                completedOrders.toString(),
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Pending',
                pendingOrders.toString(),
                Icons.pending,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Revenue',
                '${totalRevenue.toStringAsFixed(0)} LE',
                Icons.monetization_on,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesAnalytics(Map<String, int> salesCount) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top-Selling Drinks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: salesCount.isEmpty
                ? _buildEmptyAnalytics()
                : _buildSalesList(salesCount),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyAnalytics() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No sales data yet',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Complete some orders to see analytics',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesList(Map<String, int> salesCount) {
    final sortedEntries = salesCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return ListView.builder(
      itemCount: sortedEntries.length,
      itemBuilder: (context, index) {
        final entry = sortedEntries[index];
        final isTopSeller = index == 0 && entry.value > 0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isTopSeller ? Colors.amber : Colors.brown[100],
              child: Icon(
                isTopSeller ? Icons.star : Icons.local_cafe,
                color: isTopSeller ? Colors.white : Colors.brown,
                size: 20,
              ),
            ),
            title: Row(
              children: [
                Text(
                  entry.key,
                  style: TextStyle(
                    fontWeight: isTopSeller
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                if (isTopSeller) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.trending_up, color: Colors.amber, size: 16),
                ],
              ],
            ),
            subtitle: Text('Sales count'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isTopSeller ? Colors.amber[100] : Colors.brown[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${entry.value}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isTopSeller ? Colors.amber[800] : Colors.brown[800],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
