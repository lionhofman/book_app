import 'package:book_app/app/data/models/access_info_response.dart';
import 'package:book_app/app/data/models/sale_info_response.dart';
import 'package:book_app/app/data/models/search_info_response.dart';
import 'package:book_app/app/data/models/volume_info_response.dart';
import 'package:book_app/app/domain/entities/access_info.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:book_app/app/domain/entities/sale_info.dart';
import 'package:book_app/app/domain/entities/search_info.dart';
import 'package:book_app/app/domain/entities/volume_info.dart';

class BookItemResponse extends BookItem {
  BookItemResponse({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
    AccessInfo? accessInfo,
    SearchInfo? searchInfo,
  }) : super(
          kind: kind,
          id: id,
          etag: etag,
          selfLink: selfLink,
          volumeInfo: volumeInfo,
          saleInfo: saleInfo,
          accessInfo: accessInfo,
          searchInfo: searchInfo,
        );

  factory BookItemResponse.fromJson(Map<String, dynamic> json) {
    return BookItemResponse(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: json['volumeInfo'] != null
          ? VolumeInfoResponse.fromJson(json['volumeInfo'])
          : null,
      saleInfo: json['saleInfo'] != null
          ? SaleInfoResponse.fromJson(json['saleInfo'])
          : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfoResponse.fromJson(json['accessInfo'])
          : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfoResponse.fromJson(json['searchInfo'])
          : null,
    );
  }
}
