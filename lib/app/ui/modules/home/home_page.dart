import 'package:book_app/app/core/multilanguage/messages.dart';
import 'package:book_app/app/ui/modules/app_bar/app_bar_book.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppBarBook(),
      body: Center(
        child: Text(Messages.of(context).myPage),
      ),
    ));
  }
}
