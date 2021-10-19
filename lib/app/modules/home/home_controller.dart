import 'package:about_you/app/data/models/contact.dart';
import 'package:about_you/app/data/models/section.dart';
import 'package:about_you/app/data/repositories/source_repository.dart';
import 'package:about_you/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Section<Contact>> store = [];

  final ScrollController scrollController = ScrollController();

  bool isSearching = false;

  @override
  void onInit() {
    getDataFromSource();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void getDataFromSource() async {
    store = await Get.find<SourceRepository>().getDataFromSource();
    store.sort((a, b) => a.title.compareTo(b.title));
    update();
  }

  void toDetailPage({Contact contact}) {
    Get.toNamed(
      AppRoutes.detail,
      arguments: {'contact': contact},
    );
  }

  void searchingState({bool state}) {
    isSearching = state;
    update();
  }

  void searchOnList({String value}) async {
    searchingState(state: true);

    store = await Get.find<SourceRepository>().getDataFromSource();

    for (var s in store) {
      s.items.retainWhere(
          (contact) => contact.name.toLowerCase().trim().contains(value.toLowerCase().trim()));
    }

    store = store
        .where((section) => section.items
            .where(
                (contact) => contact.name.toLowerCase().trim().contains(value.toLowerCase().trim()))
            .isNotEmpty)
        .toList();

    store.sort((a, b) => a.title.compareTo(b.title));

    update();
  }
}
