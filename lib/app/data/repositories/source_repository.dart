import 'package:about_you/app/data/models/contact.dart';
import 'package:about_you/app/data/models/section.dart';
import 'package:about_you/app/data/providers/source_provider.dart';
import 'package:get/get.dart';

class SourceRepository {
  Future<List<Section<Contact>>> getDataFromSource() async {
    return await Get.find<SourceProvider>().provideDataFromSource();
  }
}
