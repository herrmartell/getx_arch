import 'package:about_you/app/data/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBuilder extends StatelessWidget {
  final Function onPressed;
  final Contact contact;

  const ItemBuilder({this.onPressed, this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: Get.width,
      child: FlatButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              contact.name.toLowerCase().capitalize,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
