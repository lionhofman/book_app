import 'package:book_app/app/ui/modules/book_detail/book_detail_binding.dart';
import 'package:book_app/app/ui/modules/book_detail/book_detail_page.dart';
import 'package:book_app/app/ui/modules/home/home_binding.dart';
import 'package:book_app/app/ui/modules/home/home_page.dart';

import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.BOOK_DETAIL_PAGE,
      page: () => BookDetailPage(),
      binding: BookDetailBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
