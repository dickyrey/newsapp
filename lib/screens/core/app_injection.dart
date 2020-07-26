import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/sign_in_prov.dart';
import '../../providers/sign_up_prov.dart';
import 'app_widget.dart';

class AppInjection extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: AppWidget(),
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ],
    );
  }
}
