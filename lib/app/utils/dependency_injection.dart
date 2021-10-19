import 'package:about_you/app/data/providers/source_provider.dart';
import 'package:about_you/app/data/repositories/source_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    Get.put<SourceRepository>(SourceRepository());
    Get.put<SourceProvider>(SourceProvider());
  }
}