import 'order.dart';

class OrderManager {
  final List<Order> _orders = [];

  void addOrder(Order order) {
    _orders.add(order);
  }

  List<Order> getPendingOrders() {
    return _orders.where((order) => !order.isCompleted).toList();
  }

  List<Order> getCompletedOrders() {
    return _orders.where((order) => order.isCompleted).toList();
  }

  List<Order> getAllOrders() {
    return List.unmodifiable(_orders);
  }

  Map<String, int> getDrinkSalesCount() {
    final salesCount = <String, int>{};
    for (final order in _orders) {
      final drinkName = order.drink.getDisplayName();
      salesCount[drinkName] = (salesCount[drinkName] ?? 0) + 1;
    }
    return salesCount;
  }

  double getTotalRevenue() {
    return _orders.fold(0.0, (sum, order) => sum + order.drink.getPrice());
  }

  int getTotalOrdersCount() {
    return _orders.length;
  }

  int getCompletedOrdersCount() {
    return getCompletedOrders().length;
  }

  int getPendingOrdersCount() {
    return getPendingOrders().length;
  }
}
