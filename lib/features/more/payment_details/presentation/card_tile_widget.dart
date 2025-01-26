import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/core/app_container_button.dart';
import 'package:payment_module/core/app_theme.dart';

import '../../../../core/app_generic_image_widget.dart';
import '../data/models/card_model.dart';

class CardTileWidget extends StatelessWidget {
  final CardModel card;
  final bool isSelected;
  final bool showDefault;
  const CardTileWidget({
    super.key,
    required this.card,
    this.isSelected = false,
    this.showDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppImageWidget(
                url: card.cardType.iconPath,
                borderRadius: 20.r,
                height: 70.h,
                width: 70.w,
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        card.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // SizedBox(width: 8.w),
                      if (showDefault) _defaultWidget(),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    card.encryptedCardNumber,
                    style: const TextStyle(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isSelected)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(14.r),
              ),
              child: const Icon(Icons.check, color: AppColors.light, size: 16),
            ),
        ],
      ),
    );
  }

  Widget _defaultWidget() {
    if (card.isDefault) {
      return _defaultContainer('Default');
    } else {
      return AppContainerButton(
        borderRadius: 14.r,
        child: const Text(
          'Set As Default',
          style: TextStyle(
            color: AppColors.primary,
          ),
        ),
        onPressed: () {},
      );
    }
  }

  Container _defaultContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 4.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
