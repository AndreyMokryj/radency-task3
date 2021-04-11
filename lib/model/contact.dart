import 'package:uuid/uuid.dart';

class Contact {
  final String id = Uuid().v1();
  String name;
  String company;
  String image;
  bool favourite;

  Contact({this.name, this.company, this.image, this.favourite = false});

  String getLastName(){
    String name1 = name.trim();
    int index = name1.lastIndexOf(" ");

    return name1.substring(index + 1);
  }

  String getLastNameLetter(){
    return getLastName()[0];
  }

  String getInitials(){
    String lastName = getLastName();
    return name.trim()[0] + (lastName != name.trim() ? lastName[0] : "");
  }
}