import 'package:book_app/app/domain/entities/pdf.dart';

class PdfResponse extends Pdf {
  PdfResponse({bool? isAvailable, String? acsTokenLink})
      : super(isAvailable: isAvailable, acsTokenLink: acsTokenLink);

  factory PdfResponse.fromJson(Map<String, dynamic> json) {
    return PdfResponse(
      isAvailable: json['isAvailable'],
      acsTokenLink: json['acsTokenLink'],
    );
  }
}
