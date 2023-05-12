import 'package:book_app/app/domain/entities/access_info.dart';
import 'package:book_app/app/domain/entities/sale_info.dart';
import 'package:book_app/app/domain/entities/search_info.dart';
import 'package:book_app/app/domain/entities/volume_info.dart';

class BookItem {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookItem({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });
}
