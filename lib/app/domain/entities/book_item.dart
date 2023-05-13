import 'package:book_app/app/domain/entities/sale_info.dart';

import 'package:book_app/app/domain/entities/volume_info.dart';
import 'package:hive/hive.dart';
part 'book_item.g.dart';

@HiveType(typeId: 0)
class BookItem extends HiveObject {
  @HiveField(0)
  String? kind;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? etag;
  @HiveField(3)
  String? selfLink;
  @HiveField(4)
  VolumeInfo? volumeInfo;
  @HiveField(5)
  SaleInfo? saleInfo;

  BookItem({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  });
}
