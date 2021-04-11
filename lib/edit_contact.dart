import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radency_task3/main.dart';
import 'package:radency_task3/model/contact.dart';
import 'package:radency_task3/styles.dart';

class EditContactPage extends StatefulWidget{
  final Contact user;

  const EditContactPage({Key key, this.user}) : super(key: key);

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Contact user;

  @override
  void initState() {
    user = widget.user;
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
          // onPressed: (){
          //   setState(() {
          //     contacts.firstWhere((element) => user.id == element.id).copyFrom(user);
          //   });
          //   Navigator.of(context).pop();
          // },

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
                foregroundImage: (user.image ?? "").isNotEmpty ? AssetImage(user.image) : null,
                child: Text(
                  user.getInitials(),
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
                    initialValue: user.name,
                    decoration: AppDecoration(),
                    onSaved: (val) => user.name = val,
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
      setState(() {
        contacts.firstWhere((element) => user.id == element.id).copyFrom(user);
      });
      Navigator.of(context).pop();
    }
    else {
      setState(() {
        // validate = true;
      });
    }
  }
}