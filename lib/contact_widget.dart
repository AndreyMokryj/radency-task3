import 'package:flutter/material.dart';
import 'package:radency_task3/main.dart';
import 'package:radency_task3/model/contact.dart';
import 'package:radency_task3/styles.dart';

class ContactWidget extends StatefulWidget{
  final Contact user;

  const ContactWidget({Key key, this.user}) : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  Contact user;

  @override
  void initState() {
    user = widget.user;
  }

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
              color: user.favourite ? Colors.cyan : Colors.transparent,
            ),
          ),
          onTap: (){
            setState(() {
              contacts.firstWhere((element) => user.id == element.id).favourite = !(user.favourite);
            });
          },
        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 25,
            foregroundImage: (user.image ?? "").isNotEmpty ? AssetImage(user.image) : null,
            child: Text(
              user.getInitials(),
              style: initialsStyle,
            ),
          ),
          onTap: (){
            Navigator.of(context).pushNamed("/edit", arguments: user);
          },
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: nameStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(user.company),
          ],
        )
      ],
    );
  }
}