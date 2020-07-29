import 'package:flutter/material.dart';

import '../../../models/channel_model.dart';
import '../../../utils/constants.dart';

class ProgramListWidget extends StatelessWidget {
  const ProgramListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      child: ListView.builder(
        itemCount: channelList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var channel = channelList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(
                        channel.logo,
                      ),
                    ),
                  ),
                ),
                Text(
                  channel.name,
                  style: headline3,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
