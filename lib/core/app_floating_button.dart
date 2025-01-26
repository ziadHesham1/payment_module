import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/core/app_theme.dart';

class AppFloatingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppFloatingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(260.w, 40.h),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
