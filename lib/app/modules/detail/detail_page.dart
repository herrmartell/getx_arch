import 'package:about_you/app/modules/detail/appbar/simple_appbar.dart';
import 'package:about_you/app/modules/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        appBar: SimpleAppBar(),
        body: Center(
          child: Text(
            controller.contact.name.capitalize,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
              fontFamilyFallback: ['Monospaced'],
            ),
          ),
        ),
      ),
    );
  }
}
