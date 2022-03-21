import 'package:flutter/material.dart';
import 'package:whatsapp/constand/constants.dart';
import 'package:whatsapp/model/status_model/StatusHelper.dart';
import 'package:whatsapp/model/status_model/StatusItemModel.dart';


class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        StatusItemModel statusItemModel = StatusHelper.getStatusItem(position);

        return Column(
          children: <Widget>[
            ListTile(
              leading:  CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(statusItemModel.image),
              ),
              title:  Text(
                statusItemModel.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                statusItemModel.name+", "+statusItemModel.dateTime,
                style: Theme.of(context).textTheme.bodyText1,
              ) ,
            ),
            const Divider(),
          ],
        );
      },
      itemCount: StatusHelper.itemCount,
    );
  }
}
