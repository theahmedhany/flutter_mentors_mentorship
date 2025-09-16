import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/order_manager.dart';

class PendingOrdersTab extends StatelessWidget {
  final OrderManager orderManager;
  final VoidCallback onOrderCompleted;

  const PendingOrdersTab({
    super.key,
    required this.orderManager,
    required this.onOrderCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final pendingOrders = orderManager.getPendingOrders();

    return pendingOrders.isEmpty
        ? _buildEmptyState()
        : _buildOrdersList(pendingOrders, context);
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.coffee, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No pending orders',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Order> pendingOrders, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: pendingOrders.length,
      itemBuilder: (context, index) {
        final order = pendingOrders[index];
        return _buildOrderCard(order, context);
      },
    );
  }

  Widget _buildOrderCard(Order order, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: _buildOrderIdChip(order.id),
        title: Text(
          order.getOrderSummary(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${order.drink.getPrice()} LE',
              style: TextStyle(color: Colors.grey[600]),
            ),
            if (order.specialInstructions.isNotEmpty) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Text(
                  'Note: ${order.specialInstructions}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange[800],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () => _completeOrder(order, context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Complete'),
        ),
      ),
    );
  }

  Widget _buildOrderIdChip(int orderId) {
    return CircleAvatar(
      backgroundColor: Colors.brown[600],
      radius: 20,
      child: Text(
        '#$orderId',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  void _completeOrder(Order order, BuildContext context) {
    order.markCompleted();
    onOrderCompleted();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order #${order.id} completed! ✅'),
        backgroundColor: Colors.brown[800],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
