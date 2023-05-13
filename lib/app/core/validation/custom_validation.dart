import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomValidation {
  static void validateLaunchURL({required String? url}) async {
    if (url != null) {
      Uri myUri = Uri.parse(url);
      await launchUrl(
        myUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static String formatPrice({required String? price}) {
    String priceString = "";
    if (price != null) {
      final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
      priceString = formatCurrency.format(double.parse(price));
    }
    return priceString;
  }
}
