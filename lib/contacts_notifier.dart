import 'package:flutter/material.dart';
import 'package:radency_task3/model/contact.dart';

class ContactsNotifier extends ChangeNotifier {
  List<Contact> _contacts;
  get contacts => _contacts;
  
  ContactsNotifier({List<Contact> contacts}){
    _contacts = contacts;
  }
  
  void updateContact(Contact updatedContact){
    _contacts.firstWhere((element) => element.id == updatedContact.id).copyFrom(updatedContact);
    notifyListeners();
  }

  void swithcFavourite(String id){

    Contact contact = _contacts.firstWhere((element) => element.id == id);
    contact.favourite = !(contact.favourite);
    notifyListeners();
  }
}