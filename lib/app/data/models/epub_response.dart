import 'package:book_app/app/domain/entities/epub.dart';

class EpubResponse extends Epub {
  EpubResponse({bool? isAvailable}) : super(isAvailable: isAvailable);

  factory EpubResponse.fromJson(Map<String, dynamic> json) {
    return EpubResponse(
      isAvailable: json['isAvailable'],
    );
  }
}
