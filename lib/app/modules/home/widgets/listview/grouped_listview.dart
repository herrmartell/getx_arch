import 'package:about_you/app/modules/home/home_controller.dart';
import 'package:about_you/app/modules/home/widgets/listview/items/separator_item.dart';
import 'package:about_you/app/utils/type_definitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class GroupedListView<T, S extends ExpandableListSection<T>> extends StatelessWidget {
  final List<S> itemList;
  final ItemBuilder itemBuilder;
  final SectionBuilder sectionBuilder;
  final Widget appbar;
  final Widget top;
  final Widget bottom;
  final ScrollController controller;

  const GroupedListView({
    this.itemList,
    this.itemBuilder,
    this.sectionBuilder,
    this.appbar,
    this.top,
    this.bottom,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        Builder(
          builder: (context) {
            if (appbar != null) {
              return appbar;
            } else {
              return SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (top != null) {
              return top;
            } else {
              return SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (Get.find<HomeController>().store.isNotEmpty) {
              return SliverExpandableList(
                builder: SliverExpandableChildDelegate<T, S>(
                  sectionList: itemList,
                  headerBuilder: sectionBuilder,
                  itemBuilder: itemBuilder,
                  separatorBuilder: (context, isSection, index) {
                    return Builder(
                      builder: (context) {
                        if (isSection) {
                          return SeparatorItem();
                        } else {
                          return SeparatorItem(
                            color: Colors.grey.shade400,
                            height: 1,
                          );
                        }
                      },
                    );
                  },
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('No name found with that value.'),
                  ),
                ),
              );
            }
          },
        ),
        Builder(
          builder: (context) {
            if (bottom != null) {
              return bottom;
            } else {
              return SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
          },
        ),
      ],
    );
  }
}
