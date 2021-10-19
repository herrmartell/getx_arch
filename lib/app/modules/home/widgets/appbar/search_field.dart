import 'package:about_you/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Container(
        height: 40,
        child: TextField(
          autofocus: false,
          textAlignVertical: TextAlignVertical.bottom,
          onChanged: (value) => Get.find<HomeController>().searchOnList(value: value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade400,
              ),
            ),
            hintText: 'Search by name',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 40);
}
