import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Name",
                          // style: companyStyle,
                          style: formLabelStyle,
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
                    style: formTextStyle,
                    maxLength: 70,
                    decoration: AppDecoration(),
                    onSaved: (val) => contact.name = val,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Phone Number",
                          style: formLabelStyle,
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
                    initialValue: contact.phone,
                    keyboardType: TextInputType.phone,
                    style: formTextStyle,
                    decoration: AppDecoration(),
                    onSaved: (val) => contact.phone = val,
                    validator: (val) => (val.length == 13 && val.startsWith("+380")) || (val ?? "").length == 0 ? null : "Invalid phone number",
                    buildCounter: (context, {int currentLength, bool isFocused, int maxLength}) => Text("+38 xxx xxx xx xx") as Widget,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Company Name",
                    style: formLabelStyle,
                  ),
                  TextFormField(
                    initialValue: contact.company,
                    style: formTextStyle,
                    decoration: AppDecoration(),
                    onSaved: (val) => contact.company = val,
                    maxLength: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bio",
                    style: formLabelStyle,
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: 3,
                    initialValue: contact.bio,
                    style: formTextStyle,
                    decoration: AppDecoration(),
                    onSaved: (val) => contact.bio = val,
                    maxLength: 110,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SafeArea(child: Container())
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