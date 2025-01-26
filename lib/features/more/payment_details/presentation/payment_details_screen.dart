import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_card_screen.dart';
import '../data/models/card_model.dart';
import 'card_tile_widget.dart';
import '../../../../core/app_floating_button.dart';
import '../../../../core/navigation_extensions.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = List.generate(10, (index) => CardModel.dummy);
    list = [list[0], list[1].copyWith(isDefault: true), ...list.sublist(2)];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CardTileWidget(
              card: list[index],
              // isSelected: index == 1,
              showDefault: true,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppFloatingButton(
        text: 'Add Card',
        onPressed: () => _onAddCardPressed(context),
      ),
    );
  }

  void _onAddCardPressed(BuildContext context) {
    context.push(const AddCardScreen());
  }
}
