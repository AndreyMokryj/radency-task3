import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radency_task3/contacts_notifier.dart';
import 'package:radency_task3/model/contact.dart';
import 'package:radency_task3/styles.dart';

class EditContactPage extends StatefulWidget{
  final Contact contact;

  const EditContactPage({Key key, this.contact}) : super(key: key);

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Contact contact;

  @override
  void initState() {
    contact = widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(
          child: Text(
            "Save",
            style: buttonTextStyle,
          ),
          onPressed: _submit,
        )],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              child: CircleAvatar(
                radius: 60,
                foregroundImage: (contact.image ?? "").isNotEmpty ? AssetImage(contact.image) : null,
                child: Text(
                  contact.getInitials(),
                  style: initialsStyle,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Name",
                          style: companyStyle,
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    initialValue: contact.name,
                    decoration: AppDecoration(),
                    onSaved: (val) => contact.name = val,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Provider.of<ContactsNotifier>(context, listen: false).updateContact(contact);
      Navigator.of(context).pop();
    }
    else {
      setState(() {
        // validate = true;
      });
    }
  }
}