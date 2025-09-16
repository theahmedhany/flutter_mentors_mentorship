import 'package:flutter/material.dart';

import '../models/order.dart';
import '../models/order_manager.dart';
import '../utils/drink_factory.dart';

class AddOrderTab extends StatefulWidget {
  final OrderManager orderManager;
  final VoidCallback onOrderAdded;

  const AddOrderTab({
    super.key,
    required this.orderManager,
    required this.onOrderAdded,
  });

  @override
  State<AddOrderTab> createState() => _AddOrderTabState();
}

class _AddOrderTabState extends State<AddOrderTab> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController specialInstructionsController =
      TextEditingController();

  String selectedDrink = 'Shai';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCustomerNameField(),
          const SizedBox(height: 16),
          _buildDrinkSelectionField(),
          const SizedBox(height: 16),
          _buildSpecialInstructionsField(),
          const SizedBox(height: 24),
          _buildAddOrderButton(),
        ],
      ),
    );
  }

  Widget _buildCustomerNameField() {
    return TextField(
      controller: customerNameController,
      decoration: const InputDecoration(
        labelText: 'Customer Name',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        hintText: 'Enter customer name',
      ),
      textCapitalization: TextCapitalization.words,
    );
  }

  Widget _buildDrinkSelectionField() {
    return DropdownButtonFormField<String>(
      value: selectedDrink,
      decoration: const InputDecoration(
        labelText: 'Drink Type',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.local_cafe),
      ),
      items: DrinkFactory.getAvailableDrinks()
          .map(
            (drink) => DropdownMenuItem(
              value: drink,
              child: Text(
                '$drink - ${DrinkFactory.getDrinkPrices()[drink]?.toStringAsFixed(0)} LE',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
          .toList(),
      onChanged: (value) => setState(() => selectedDrink = value!),
    );
  }

  Widget _buildSpecialInstructionsField() {
    return TextField(
      controller: specialInstructionsController,
      decoration: const InputDecoration(
        labelText: 'Special Instructions',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.note_alt_rounded),
        hintText: 'e.g., "extra mint, ya rais"',
      ),
    );
  }

  Widget _buildAddOrderButton() {
    return ElevatedButton(
      onPressed: _addOrder,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[600],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Add Order', style: TextStyle(fontSize: 16)),
    );
  }

  void _addOrder() {
    if (customerNameController.text.trim().isEmpty) {
      _showSnackBar('Please enter customer name', isError: true);
      return;
    }

    try {
      final drink = DrinkFactory.createDrink(selectedDrink);
      final order = Order(
        customerName: customerNameController.text.trim(),
        drink: drink,
        specialInstructions: specialInstructionsController.text.trim(),
      );

      widget.orderManager.addOrder(order);

      customerNameController.clear();
      specialInstructionsController.clear();

      _showSnackBar('Order added successfully!');
      widget.onOrderAdded();
    } catch (e) {
      _showSnackBar('Error adding order: $e', isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.brown[800],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    customerNameController.dispose();
    specialInstructionsController.dispose();
    super.dispose();
  }
}
