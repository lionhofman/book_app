import 'package:hive/hive.dart';
part 'price.g.dart';

@HiveType(typeId: 4)
class Price extends HiveObject {
  @HiveField(0)
  final String? amount;
  final String? currencyCode;

  Price({
    this.amount,
    this.currencyCode,
  });
}
