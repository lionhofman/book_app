import 'package:book_app/app/domain/entities/reading_modes.dart';

class ReadingModesResponse extends ReadingModes {
  ReadingModesResponse({bool? text, bool? image})
      : super(text: text, image: image);

  factory ReadingModesResponse.fromJson(Map<String, dynamic> json) {
    return ReadingModesResponse(
      text: json['text'],
      image: json['image'],
    );
  }
}
