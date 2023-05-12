import 'package:book_app/app/ui/modules/search/search_binding.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    SearchBinding().dependencies();
  }
}
