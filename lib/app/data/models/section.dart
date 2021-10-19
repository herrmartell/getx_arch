import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class Section<E> implements ExpandableListSection<E> {
  String title;
  List<E> items;

  Section({this.title, this.items});

  @override
  List<E> getItems() => items;

  @override
  bool isSectionExpanded() => true;

  @override
  void setSectionExpanded(expanded) => false;
}
