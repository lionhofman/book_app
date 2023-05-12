import 'package:book_app/app/domain/entities/panelization_summary.dart';

class PanelizationSummaryResponse extends PanelizationSummary {
  PanelizationSummaryResponse(
      {bool? containsEpubBubbles, bool? containsImageBubbles})
      : super(
          containsEpubBubbles: containsEpubBubbles,
          containsImageBubbles: containsImageBubbles,
        );

  factory PanelizationSummaryResponse.fromJson(Map<String, dynamic> json) {
    return PanelizationSummaryResponse(
      containsEpubBubbles: json['containsEpubBubbles'],
      containsImageBubbles: json['containsImageBubbles'],
    );
  }
}
