import 'package:book_app/app/app_binding.dart';
import 'package:book_app/app/core/multilanguage/messages_delegate.dart';
import 'package:book_app/app/ui/app_pages.dart';
import 'package:book_app/app/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Book App",
      initialRoute: AppRoutes.HOME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'OpenSans',
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: AppPages.pages,
      defaultTransition: Transition.noTransition,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MessagesDelegate(),
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('pt', 'BR'), // portugues
      ],
      initialBinding: ApplicationBinding(),
    );
  }
}
