import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class AppBarBannerRecipe extends StatelessWidget
    implements PreferredSizeWidget {
  final AppBar appBar;
  final Size size;

  const AppBarBannerRecipe({
    Key key,
    @required this.appBar,
    @required this.size,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(appBar.preferredSize.height + height);

  double get height => max(size.height * .06, 50.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar,
        Container(
          width: size.width,
          height: height,
          child: AdmobBanner(
            //TODO: banner admob id

            adUnitId: 'ca-app-pub-3277978512888005/5515639309',
            adSize: AdmobBannerSize.ADAPTIVE_BANNER(
              width: size.width.toInt(),
            ),
          ),
        )
      ],
    );
  }
}

extension AppBarAdmobX on AppBar {
  PreferredSizeWidget withBottomAdmobBanner(BuildContext context) {
    return AppBarBannerRecipe(
      appBar: this,
      size: MediaQuery.of(context).size,
    );
  }
}
