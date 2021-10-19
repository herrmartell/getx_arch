import 'package:about_you/app/data/models/contact.dart';
import 'package:about_you/app/data/models/section.dart';
import 'package:about_you/app/modules/home/home_controller.dart';
import 'package:about_you/app/modules/home/widgets/appbar/appbar.dart';
import 'package:about_you/app/modules/home/widgets/feedback/progress_indicator.dart';
import 'package:about_you/app/modules/home/widgets/listview/bottom/bottom_widget.dart';
import 'package:about_you/app/modules/home/widgets/listview/builders/item_builder.dart';
import 'package:about_you/app/modules/home/widgets/listview/builders/section_builder.dart';
import 'package:about_you/app/modules/home/widgets/listview/grouped_listview.dart';
import 'package:about_you/app/modules/home/widgets/listview/top/top_widget.dart';
import 'package:about_you/app/widgets/defaults/blank_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            controller.searchingState(state: false);
          },
          child: Builder(
            builder: (context) {
              if (controller.store != null) {
                return NestedScrollView(
                  headerSliverBuilder: (context, isScrolled) {
                    return [AboutYouAppBar() ?? BlankWidget()];
                  },
                  body: GroupedListView<Contact, Section<Contact>>(
                    controller: controller.scrollController,
                    top: Builder(
                      builder: (context) {
                        if (controller.isSearching) {
                          return BlankWidget();
                        } else {
                          return TopWidget() ?? BlankWidget();
                        }
                      },
                    ),
                    itemList: controller.store,
                    sectionBuilder: (context, sectionIndex, index) {
                      final section = controller.store[sectionIndex];
                      return SectionBuilder(title: section.title);
                    },
                    itemBuilder: (context, sectionIndex, itemIndex, index) {
                      final contact = controller.store[sectionIndex].items[itemIndex];
                      return ItemBuilder(
                        onPressed: () => controller.toDetailPage(contact: contact),
                        contact: contact,
                      );
                    },
                    bottom: Builder(
                      builder: (context) {
                        if (controller.isSearching) {
                          return BlankWidget();
                        } else {
                          return BottomWidget() ?? BlankWidget();
                        }
                      },
                    ),
                  ),
                );
              } else {
                return AboutYouProgressIndicator() ?? BlankWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
