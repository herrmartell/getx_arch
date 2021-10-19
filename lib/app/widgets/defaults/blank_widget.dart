import 'package:flutter/material.dart';

class BlankWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox.shrink(),
    );
  }
}
