import 'package:flutter/material.dart';

const nameStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const companyStyle = TextStyle(
  fontSize: 12,
  color: Colors.grey
);

const letterStyle = TextStyle(
  fontSize: 16,
);

const initialsStyle = TextStyle(
  fontSize: 18,
);

const buttonTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

const formTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(50, 50, 50, 1.0)
);

const formLabelStyle = TextStyle(
  fontSize: 13,
);


class AppDecoration extends InputDecoration {
  const AppDecoration({
    String labelText,
    String hintText,
    bool hasFloatingPlaceholder,
    EdgeInsetsGeometry contentPadding,
    String prefixText,
  }) : super(
    contentPadding: contentPadding,
    floatingLabelBehavior: (hasFloatingPlaceholder ?? false) ? FloatingLabelBehavior.never : FloatingLabelBehavior.always,
    border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(150, 150, 150, 1.0))),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(150, 150, 150, 1.0))),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.blue)),

    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1.0)),
    hintStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(204, 204, 204, 1.0)),
    prefixText: prefixText,
    prefixStyle: formTextStyle,
  );
}
