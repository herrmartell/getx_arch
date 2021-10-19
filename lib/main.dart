import 'package:about_you/app/modules/home/home_binding.dart';
import 'package:about_you/app/modules/home/home_page.dart';
import 'package:about_you/app/routes/app_pages.dart';
import 'package:about_you/app/utils/app_configuration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AppConfiguration.init();
  runApp(GetXArchApplication());
}

class GetXArchApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Architecture Example',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      home: HomePage(),
      initialBinding: HomeBinding(),
    );
  }
}
