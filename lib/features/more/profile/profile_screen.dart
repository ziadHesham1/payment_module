import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/core/app_assets.dart';
import 'package:payment_module/core/app_container_button.dart';
import 'package:payment_module/core/app_text_button.dart';

import 'package:payment_module/core/app_theme.dart';
import 'package:payment_module/features/more/payment_details/presentation/payment_details_screen.dart';
import 'package:payment_module/core/navigation_extensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                // height: 300.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    newMethod(
                      leadingIcon: Icons.person_outline,
                      label: 'Personal Details',
                    ),
                    newMethod(
                      leadingIcon: Icons.credit_card,
                      label: 'Payment Details',
                      onPressed: () => context.push(
                        const PaymentDetailsScreen(),
                      ),
                    ),
                    newMethod(
                      leadingIcon: Icons.settings,
                      label: 'Settings',
                    ),
                    AppTextButton(
                      leadingIcon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                      label: 'Logout',
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Column newMethod({
    required IconData leadingIcon,
    required String label,
    Function()? onPressed,
  }) {
    return Column(
      children: [
        AppContainerButton(
          borderRadius: 16.r,
          onPressed: onPressed,
          child: ListTile(
            leading: Icon(
              // Icons.person_outline,
              leadingIcon,
              color: AppColors.primary,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primary,
            ),
            title: Text(
              label,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ),
        Divider(color: Colors.grey.shade100),
      ],
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AppAssets.profileImage,
            height: 140.h,
          ),
          SizedBox(height: 20.h),
          Text(
            'Ziad Hesham',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            '+201116791408',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
