import 'package:payment_module/features/more/payment_details/data/models/card_model.dart';

class PaymentMethodsModel {
  final List<CardModel> cards;

  PaymentMethodsModel({required this.cards});

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    List<CardModel> cards = [];
    if (json['cards'] != null && json['cards'] is List) {
      for (var v in (json['cards'] as List)) {
        cards.add(CardModel.fromMap(v));
      }
    }
    return PaymentMethodsModel(cards: cards);
  }
}
