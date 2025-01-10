import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/add_card_screen.dart';
import 'package:payment_module/navigation_extensions.dart';

import 'card_model.dart';
import 'card_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardModel card = CardModel(
      cardNumber: '4111 1111 1111 1111',
      cardType: CardType.visa,
      expiryDate: '12/25',
      cvv: '123',
      name: 'John Doe',
    );

    var list = List.generate(10, (index) => card);
    list = [list[0], list[1].copyWith(isDefault: true), ...list.sublist(2)];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Cards'),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.grey.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemCount: list.length,
          itemBuilder: (context, index) => CardTileWidget(card: list[index]),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: const Text('Add New Card'),
        onPressed: () {
          context.push(const AddCardScreen());
        },
      ),
    );
  }
}
