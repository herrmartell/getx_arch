import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionBuilder extends StatelessWidget {
  final String title;

  const SectionBuilder({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
