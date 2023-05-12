import 'package:book_app/app/domain/entities/search_info.dart';

class SearchInfoResponse extends SearchInfo {
  SearchInfoResponse({String? textSnippet}) : super(textSnippet: textSnippet);

  factory SearchInfoResponse.fromJson(Map<String, dynamic> json) {
    return SearchInfoResponse(
      textSnippet: json['textSnippet'],
    );
  }
}
