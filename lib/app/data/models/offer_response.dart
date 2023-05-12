import 'package:book_app/app/data/models/price_response.dart';
import 'package:book_app/app/domain/entities/offer.dart';
import 'package:book_app/app/domain/entities/price.dart';

class OfferResponse extends Offer {
  OfferResponse({
    int? finskyOfferType,
    Price? listPrice,
    Price? retailPrice,
    bool? giftable,
  }) : super(
          finskyOfferType: finskyOfferType,
          listPrice: listPrice,
          retailPrice: retailPrice,
          giftable: giftable,
        );

  factory OfferResponse.fromJson(Map<String, dynamic> json) {
    return OfferResponse(
      finskyOfferType: json['finskyOfferType'],
      listPrice: json['listPrice'] != null
          ? PriceResponse.fromJson(json['listPrice'])
          : null,
      retailPrice: json['retailPrice'] != null
          ? PriceResponse.fromJson(json['retailPrice'])
          : null,
      giftable: json['giftable'],
    );
  }
}
