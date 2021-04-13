import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radency_task3/contacts_notifier.dart';
import 'package:radency_task3/model/contact.dart';
import 'package:radency_task3/styles.dart';

class ContactWidget extends StatelessWidget{
  final Contact contact;

  const ContactWidget({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.star,
              color: contact.favourite ? Colors.cyan : Colors.transparent,
            ),
          ),
          onTap: (){
            Provider.of<ContactsNotifier>(context, listen: false).swithcFavourite(contact.id);
          },
        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 25,
            foregroundImage: (contact.image ?? "").isNotEmpty ? AssetImage(contact.image) : null,
            child: Text(
              contact.getInitials(),
              style: initialsStyle,
            ),
          ),
          onTap: (){
            Navigator.of(context).pushNamed("/edit", arguments: contact);
          },
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.name,
              style: nameStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(contact.company),
          ],
        )
      ],
    );
  }
}