import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool _autoValidation = false;

  // Key get formKey => _formKey;
  String get email => _email;
  String get password => _password;
  bool get autoValidation => _autoValidation;

  set autoValidation(bool value) {
    _autoValidation = value;
    notifyListeners();
  }

  void onSavedEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void onSavedPassword(String value) {
    _password = value;
    notifyListeners();
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Please fill email address";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Please fill password";
    } else if (value.length < 6) {
      return "Short password";
    } else {
      return null;
    }
  }
}
