import 'package:book_app/app/data/models/offer_response.dart';
import 'package:book_app/app/data/models/price_response.dart';
import 'package:book_app/app/domain/entities/offer.dart';
import 'package:book_app/app/domain/entities/price.dart';
import 'package:book_app/app/domain/entities/sale_info.dart';

class SaleInfoResponse extends SaleInfo {
  SaleInfoResponse({
    String? country,
    String? saleability,
    bool? isEbook,
    Price? listPrice,
    Price? retailPrice,
    String? buyLink,
    List<Offer>? offers,
  }) : super(
          country: country,
          saleability: saleability,
          isEbook: isEbook,
          listPrice: listPrice,
          retailPrice: retailPrice,
          buyLink: buyLink,
          offers: offers,
        );

  factory SaleInfoResponse.fromJson(Map<String, dynamic> json) {
    return SaleInfoResponse(
      country: json['country'],
      saleability: json['saleability'],
      isEbook: json['isEbook'],
      listPrice: json['listPrice'] != null
          ? PriceResponse.fromJson(json['listPrice'])
          : null,
      retailPrice: json['retailPrice'] != null
          ? PriceResponse.fromJson(json['retailPrice'])
          : null,
      buyLink: json['buyLink'],
      offers: json['offers'] != null
          ? List<Offer>.from(
              json['offers'].map((offer) => OfferResponse.fromJson(offer)))
          : null,
    );
  }
}
