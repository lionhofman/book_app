import 'package:book_app/app/domain/entities/price.dart';

class PriceResponse extends Price {
  PriceResponse({String? amount, String? currencyCode})
      : super(amount: amount, currencyCode: currencyCode);

  factory PriceResponse.fromJson(Map<String, dynamic> json) {
    return PriceResponse(
      amount: json['amount']?.toString(),
      currencyCode: json['currencyCode'],
    );
  }
}
