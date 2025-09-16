import 'drink.dart';

class Order {
  static int _idCounter = 1;

  final int id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  bool _isCompleted = false;

  Order({
    required this.customerName,
    required this.drink,
    this.specialInstructions = "",
  }) : id = _idCounter++;

  bool get isCompleted => _isCompleted;

  void markCompleted() {
    _isCompleted = true;
  }

  String getOrderSummary() {
    return "${drink.getDisplayName()} for $customerName";
  }
}
