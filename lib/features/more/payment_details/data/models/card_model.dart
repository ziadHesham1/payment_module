// ignore_for_file: public_member_api_docs, sort_constructors_first
enum CardType {
  visa,
  mastercard;

  // Get the icon path based on the card type
  String get iconPath {
    switch (this) {
      case CardType.visa:
        return 'assets/images/visa.svg';
      case CardType.mastercard:
        return 'assets/images/mastercard.svg';
      default:
        return '';
    }
  }

  // Convert the CardType to a string
  @override
  String toString() {
    switch (this) {
      case CardType.visa:
        return 'Visa';
      case CardType.mastercard:
        return 'Mastercard';
      default:
        return '';
    }
  }

  // Convert a string to a CardType
  static CardType fromString(String value) {
    switch (value) {
      case 'Visa':
        return CardType.visa;
      case 'Mastercard':
        return CardType.mastercard;
      default:
        return CardType.visa;
    }
  }
}

class CardModel {
  final String cardNumber;
  final CardType cardType; // Use CardType enum
  final String expiryDate;
  final String cvv;
  final String name;
  final bool isDefault;
  factory CardModel.empty() {
    return CardModel(
      cardNumber: '',
      cardType: CardType.visa,
      expiryDate: '',
      cvv: '',
      name: '',
    );
  }

  // Constructor
  CardModel({
    this.isDefault = false,
    required this.cardNumber,
    required this.cardType,
    required this.expiryDate,
    required this.cvv,
    required this.name,
  });
  String get encryptedCardNumber {
    if (cardNumber.length >= 4) {
      return '**** ${cardNumber.substring(cardNumber.length - 4)}';
    }
    return '****';
  }

  static final CardModel dummy = CardModel(
    cardNumber: '4111 1111 1111 1111',
    cardType: CardType.visa,
    expiryDate: '12/25',
    cvv: '123',
    name: 'John Doe',
  );

  // Convert a CardModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardType': cardType.toString(), // Store enum value as string
      'expiryDate': expiryDate,
      'cvv': cvv,
      'name': name,
    };
  }

  // Convert a map to a CardModel instance
  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardNumber: map['cardNumber'],
      cardType: CardType.fromString(map['cardType']),
      expiryDate: map['expiryDate'],
      cvv: map['cvv'],
      name: map['name'],
    );
  }

  CardModel copyWith({
    String? cardNumber,
    CardType? cardType,
    String? expiryDate,
    String? cvv,
    String? name,
    bool? isDefault,
  }) {
    return CardModel(
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
