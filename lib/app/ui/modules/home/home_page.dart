import 'package:book_app/app/ui/modules/app_bar/app_bar_book.dart';
import 'package:book_app/app/ui/modules/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: AppBarBook(),
      body: Center(
        child: Text('My Page'),
      ),
    ));
  }
}
