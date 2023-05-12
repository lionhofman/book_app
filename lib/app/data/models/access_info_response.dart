import 'package:book_app/app/data/models/epub_response.dart';
import 'package:book_app/app/data/models/pdf_response.dart';
import 'package:book_app/app/domain/entities/access_info.dart';
import 'package:book_app/app/domain/entities/epub.dart';
import 'package:book_app/app/domain/entities/pdf.dart';

class AccessInfoResponse extends AccessInfo {
  AccessInfoResponse({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Pdf? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) : super(
          country: country,
          viewability: viewability,
          embeddable: embeddable,
          publicDomain: publicDomain,
          textToSpeechPermission: textToSpeechPermission,
          epub: epub,
          pdf: pdf,
          webReaderLink: webReaderLink,
          accessViewStatus: accessViewStatus,
          quoteSharingAllowed: quoteSharingAllowed,
        );

  factory AccessInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccessInfoResponse(
      country: json['country'],
      viewability: json['viewability'],
      embeddable: json['embeddable'],
      publicDomain: json['publicDomain'],
      textToSpeechPermission: json['textToSpeechPermission'],
      epub: json['epub'] != null ? EpubResponse.fromJson(json['epub']) : null,
      pdf: json['pdf'] != null ? PdfResponse.fromJson(json['pdf']) : null,
      webReaderLink: json['webReaderLink'],
      accessViewStatus: json['accessViewStatus'],
      quoteSharingAllowed: json['quoteSharingAllowed'],
    );
  }
}
