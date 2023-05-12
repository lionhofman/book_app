import 'package:book_app/app/data/models/image_links_response.dart';
import 'package:book_app/app/data/models/panelization_summary_response.dart';
import 'package:book_app/app/data/models/reading_modes_response.dart';
import 'package:book_app/app/domain/entities/image_links.dart';
import 'package:book_app/app/domain/entities/panelization_summary.dart';
import 'package:book_app/app/domain/entities/reading_modes.dart';
import 'package:book_app/app/domain/entities/volume_info.dart';

class VolumeInfoResponse extends VolumeInfo {
  VolumeInfoResponse({
    String? title,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    ReadingModes? readingModes,
    int? pageCount,
    String? printType,
    List<String>? categories,
    int? averageRating,
    int? ratingsCount,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) : super(
          title: title,
          authors: authors,
          publisher: publisher,
          publishedDate: publishedDate,
          description: description,
          readingModes: readingModes,
          pageCount: pageCount,
          printType: printType,
          categories: categories,
          averageRating: averageRating,
          ratingsCount: ratingsCount,
          maturityRating: maturityRating,
          allowAnonLogging: allowAnonLogging,
          contentVersion: contentVersion,
          panelizationSummary: panelizationSummary,
          imageLinks: imageLinks,
          language: language,
          previewLink: previewLink,
          infoLink: infoLink,
          canonicalVolumeLink: canonicalVolumeLink,
        );

  factory VolumeInfoResponse.fromJson(Map<String, dynamic> json) {
    return VolumeInfoResponse(
      title: json['title'],
      authors:
          json['authors'] != null ? List<String>.from(json['authors']) : null,
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      readingModes: json['readingModes'] != null
          ? ReadingModesResponse.fromJson(json['readingModes'])
          : null,
      pageCount: json['pageCount'],
      printType: json['printType'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'],
      maturityRating: json['maturityRating'],
      allowAnonLogging: json['allowAnonLogging'],
      contentVersion: json['contentVersion'],
      panelizationSummary: json['panelizationSummary'] != null
          ? PanelizationSummaryResponse.fromJson(json['panelizationSummary'])
          : null,
      imageLinks: json['imageLinks'] != null
          ? ImageLinksResponse.fromJson(json['imageLinks'])
          : null,
      language: json['language'],
      previewLink: json['previewLink'],
      infoLink: json['infoLink'],
      canonicalVolumeLink: json['canonicalVolumeLink'],
    );
  }
}
