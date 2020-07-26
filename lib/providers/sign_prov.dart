import 'package:flutter/foundation.dart';

class SignInProvider with ChangeNotifier {
  String _email;
  String _password;

  String get email => _email;
  String get password => _password;
}
