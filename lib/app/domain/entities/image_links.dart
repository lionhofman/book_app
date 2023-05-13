import 'package:hive/hive.dart';
part 'image_links.g.dart';

@HiveType(typeId: 2)
class ImageLinks extends HiveObject {
  @HiveField(0)
  final String? smallThumbnail;
  @HiveField(1)
  final String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});
}
