import 'package:book_app/app/core/multilanguage/messages.dart';
import 'package:book_app/app/ui/app_routes.dart';
import 'package:book_app/app/ui/modules/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarBook extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Messages.of(context).bookApp),
      backgroundColor: Colors.white,
      actions: <Widget>[
        const Expanded(
          child: SearchPage(),
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.blue,
          ),
          onPressed: () {
            Get.toNamed(
              AppRoutes.FAVORITE_OFFLINE_PAGE,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
