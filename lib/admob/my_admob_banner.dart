import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class MyAdmobbanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdmobBanner(
      //TODO: first, change admob id at /app/src/main/Androidmanifest.xml
      //TODO: banner admob id

      adUnitId: 'ca-app-pub-3277978512888005/5515639309',
      adSize: AdmobBannerSize.BANNER,
      // listener: (AdmobAdEvent event, Map<String, dynamic> args) {
      //   if (event == AdmobAdEvent.loaded) print('admob banner loaded');
      //   if (event == AdmobAdEvent.opened) print('admob banner opened');
      //   if (event == AdmobAdEvent.closed) print('admob banner closed');
      //   if (event == AdmobAdEvent.failedToLoad)
      //     print(
      //         'Admob banner failed to load. Error code: ${args['errorCode']}');
      // },
    );
  }
}
