import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/features/more/payment_details/data/models/card_model.dart';
import 'package:payment_module/features/more/payment_details/presentation/card_tile_widget.dart';
import 'package:payment_module/features/more/payment_details/presentation/payment_details_screen.dart';

import '../../core/app_container_button.dart';
import '../../core/app_floating_button.dart';
import '../../core/app_theme.dart';
import '../../core/navigation_extensions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            _title(context),
            CardTileWidget(card: CardModel.dummy.copyWith(isDefault: true)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppFloatingButton(
        text: 'Complete Purchase',
        onPressed: () => _onCompletePurchasePressed(context),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppContainerButton(
          onPressed: () {
            context.push(const PaymentDetailsScreen());
          },
          child: const Text(
            'Edit',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  void _onCompletePurchasePressed(BuildContext context) {
    context.pop();
  }
}
