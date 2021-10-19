import 'package:about_you/app/utils/colors_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 32,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 32,
            width: Get.width,
            color: ColorList.color[index],
            child: FlatButton(
              onPressed: () => null,
              child: Text('Button Number $index'),
            ),
          );
        },
        childCount: 9,
      ),
    );
  }
}
