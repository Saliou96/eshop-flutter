import 'package:eshop/routes/app_pages.dart';
import 'package:eshop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: AppRoutes.home,
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
  ));
}
