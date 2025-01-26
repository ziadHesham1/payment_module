import 'package:flutter/material.dart';
import 'package:payment_module/core/app_floating_button.dart';
import 'package:payment_module/core/navigation_extensions.dart';
import 'package:payment_module/features/checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: const Center(
        child: Text(''),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppFloatingButton(
        text: 'Checkout',
        onPressed: () => _onCheckoutPressed(context),
      ),
    );
  }

  void _onCheckoutPressed(BuildContext context) {
    context.push(const CheckoutScreen());
  }
}
