import 'package:about_you/app/data/models/contact.dart';
import 'package:about_you/app/data/models/section.dart';
import 'package:about_you/app/data/source/data_source.dart';
import 'package:get/get.dart';

class SourceProvider {
  Future<List<Section<Contact>>> provideDataFromSource() async {
    List<Section<Contact>> sectionList = [];
    List<Contact> contactList = [];
    List<String> tempSections = [];

    SourceList.contacts.forEach((contact) {
      if (contact != null) {
        if (contact.isNotEmpty) {
          contactList.add(Contact(
            name: contact.trimLeft().toLowerCase(),
            surname: contact.trimLeft().toLowerCase().split(' ').last,
            forename: contact.trimLeft().toLowerCase().split(' ').first,
          ));
        }
      }
    });

    contactList.forEach((contact) {
      if (contact.name.trim().isNotEmpty) {
        tempSections.add(contact.name[0]);
      }
    });

    tempSections = tempSections.toSet().toList();

    tempSections.forEach((section) {
      sectionList.add(Section(
        title: section.capitalize,
        items: contactList.where((contact) => section == contact.name[0]).toList(),
      ));
    });

    sectionList.forEach((element) => element.items.toSet().toList());

    return sectionList;
  }
}
