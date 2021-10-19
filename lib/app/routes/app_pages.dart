import 'package:about_you/app/modules/detail/detail_binding.dart';
import 'package:about_you/app/modules/detail/detail_page.dart';
import 'package:about_you/app/modules/home/home_binding.dart';
import 'package:about_you/app/modules/home/home_page.dart';
import 'package:about_you/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
