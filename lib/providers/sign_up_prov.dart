import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String _fullName;
  String _email;
  String _password;
  bool _autoValidation = false;
  bool _fullNameComplete = false;
  bool _emailComplete = false;
  bool _passwordComplete = false;

  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;
  bool get autoValidation => _autoValidation;
  bool get fullNameComplete => _fullNameComplete;
  bool get emailComplete => _emailComplete;
  bool get passwordComplete => _passwordComplete;
  set autoValidation(bool value) {
    _autoValidation = value;
    notifyListeners();
  }

  void onSavedFullName(String value) {
    _fullName = value;
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

  String validateFullName(String value) {
    String patttern = r'(^[a-zA-Z _.-]*$)';

    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      _fullNameComplete = false;
      return "Please fill your name";
    } else if (!regExp.hasMatch(value)) {
      _fullNameComplete = false;
      return "Invalid full name format";
    }
    _fullNameComplete = true;
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      _emailComplete = false;
      // notifyListeners();
      return "Please fill email address";
    } else if (!regExp.hasMatch(value)) {
      _emailComplete = false;
      // notifyListeners();
      return "Invalid email";
    } else {
      _emailComplete = true;
      // notifyListeners();
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      _passwordComplete = false;
      return "Please fill password";
    } else if (value.length < 6) {
      _passwordComplete = false;
      return "Short password";
    } else {
      _passwordComplete = true;
      return null;
    }
  }
}
