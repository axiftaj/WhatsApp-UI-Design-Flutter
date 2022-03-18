import 'package:whatsapp/StatusItemModel.dart';

class StatusHelper {

  static var statusList = [StatusItemModel("John Snow", "Yesterday, 21:22 PM"), StatusItemModel("GOT", "Yesterday, 09:09 PM")];

  static StatusItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;

}