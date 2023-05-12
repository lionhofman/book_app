import 'package:book_app/app/domain/entities/image_links.dart';

class ImageLinksResponse extends ImageLinks {
  ImageLinksResponse({String? smallThumbnail, String? thumbnail})
      : super(smallThumbnail: smallThumbnail, thumbnail: thumbnail);

  factory ImageLinksResponse.fromJson(Map<String, dynamic> json) {
    return ImageLinksResponse(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }
}
