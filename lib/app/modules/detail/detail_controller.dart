import 'package:about_you/app/data/models/contact.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  Contact contact = Contact();

  @override
  void onInit() {
    contact = Get.arguments['contact'];
    super.onInit();
  }
}
