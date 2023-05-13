import 'package:book_app/app/domain/entities/image_links.dart';
import 'package:book_app/app/domain/entities/panelization_summary.dart';
import 'package:book_app/app/domain/entities/reading_modes.dart';
import 'package:hive/hive.dart';
part 'volume_info.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final List<String>? authors;
  @HiveField(2)
  final String? publisher;
  final String? publishedDate;
  @HiveField(3)
  final String? description;
  final ReadingModes? readingModes;
  @HiveField(4)
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final int? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  @HiveField(5)
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });
}
