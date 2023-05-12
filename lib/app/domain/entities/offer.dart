import 'package:book_app/app/domain/entities/price.dart';

class Offer {
  final int? finskyOfferType;
  final Price? listPrice;
  final Price? retailPrice;
  final bool? giftable;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });
}
