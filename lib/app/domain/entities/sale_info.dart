import 'package:book_app/app/domain/entities/offer.dart';
import 'package:book_app/app/domain/entities/price.dart';
import 'package:hive/hive.dart';
part 'sale_info.g.dart';

@HiveType(typeId: 3)
class SaleInfo extends HiveObject {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final Price? listPrice;
  @HiveField(0)
  final Price? retailPrice;
  @HiveField(1)
  final String? buyLink;
  final List<Offer>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });
}
