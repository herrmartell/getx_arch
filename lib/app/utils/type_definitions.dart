import 'package:flutter/material.dart';

typedef SectionBuilder = Widget Function(
  BuildContext context,
  int sectionIndex,
  int index,
);

typedef ItemBuilder = Widget Function(
  BuildContext context,
  int sectionIndex,
  int itemIndex,
  int index,
);
