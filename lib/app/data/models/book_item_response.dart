import 'package:book_app/app/data/models/sale_info_response.dart';
import 'package:book_app/app/data/models/volume_info_response.dart';
import 'package:book_app/app/domain/entities/book_item.dart';
import 'package:book_app/app/domain/entities/sale_info.dart';
import 'package:book_app/app/domain/entities/volume_info.dart';

class BookItemResponse extends BookItem {
  BookItemResponse({
    String? kind,
    String? id,
    String? etag,
    String? selfLink,
    VolumeInfo? volumeInfo,
    SaleInfo? saleInfo,
  }) : super(
          kind: kind,
          id: id,
          etag: etag,
          selfLink: selfLink,
          volumeInfo: volumeInfo,
          saleInfo: saleInfo,
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
    );
  }
}
