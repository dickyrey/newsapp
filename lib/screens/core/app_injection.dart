import 'package:flutter/material.dart';
import 'package:newsapp/providers/sign_prov.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';

class AppInjection extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: AppWidget(),
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider())
      ],
    );
  }
}
