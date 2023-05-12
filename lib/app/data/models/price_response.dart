import 'package:book_app/app/domain/entities/price.dart';

class PriceResponse extends Price {
  PriceResponse({double? amount, String? currencyCode})
      : super(amount: amount, currencyCode: currencyCode);

  factory PriceResponse.fromJson(Map<String, dynamic> json) {
    return PriceResponse(
      amount: json['amount'],
      currencyCode: json['currencyCode'],
    );
  }
}
