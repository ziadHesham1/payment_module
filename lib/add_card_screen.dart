import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_module/app_generic_image_widget.dart';
import 'package:payment_module/app_text_field.dart';
import 'package:payment_module/card_model.dart';
import 'package:payment_module/constants.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  CardType _selectedCardType = CardType.visa;
  CardModel newCard = CardModel.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Card')),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _cardNumberController,
                      title: 'Card Number',
                      hintText: 'Enter your card number',
                      keyboardType: TextInputType.number,
                      maxLength: 19,
                    ),
                  ),
                  SizedBox(width: 16.h),
                  _selectCardWidget(),
                ],
              ),
              SizedBox(height: 16.h),
              AppTextField(
                controller: _expiryDateController,
                title: 'Expiry Date',
                hintText: 'MM/YY',
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 16.h),
              AppTextField(
                controller: _cvvController,
                title: 'CVV',
                hintText: 'Enter CVV',
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              AppTextField(
                controller: _nameController,
                title: 'Name on Card',
                hintText: 'Enter your name',
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: _submitCard,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(260.w, 50.h),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: const Text(
          'Add Card',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  InkWell _selectCardWidget() {
    var list = CardType.values;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCardType = _selectedCardType == CardType.visa
              ? CardType.mastercard
              : CardType.visa;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: list
            .map((cardType) => _cardTypeWidget(cardType: cardType))
            .toList(),
      ),
    );
  }

  Container _cardTypeWidget({
    required CardType cardType,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: _selectedCardType == cardType
            ? Border.all(color: AppColors.primary)
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppImageWidget(
        url: cardType.iconPath,
        height: 30.h,
        width: 30.0,
      ),
    );
  }

  void _submitCard() {
    CardModel card = CardModel(
      cardNumber: _cardNumberController.text,
      cardType: _selectedCardType,
      expiryDate: _expiryDateController.text,
      cvv: _cvvController.text,
      name: _nameController.text,
    );

    print('Encrypted Card Number: ${card.encryptedCardNumber}');
  }
}
