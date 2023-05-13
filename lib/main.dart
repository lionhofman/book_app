import 'package:book_app/app/app_widget.dart';
import 'package:book_app/app/data/database/hive/hive_db_service.dart';
import 'package:flutter/material.dart';

void main() async {
  var hiveDBService = HiveDbService.instance;
  await hiveDBService.asyncInit();
  runApp(const AppWidget());
}
