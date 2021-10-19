import 'package:about_you/app/modules/home/widgets/appbar/search_field.dart';
import 'package:flutter/material.dart';

class AboutYouAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      expandedHeight: 100,
      pinned: true,
      brightness: Brightness.light,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'ABOUT',
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'YOU',
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottom: SearchField(),
    );
  }
}
