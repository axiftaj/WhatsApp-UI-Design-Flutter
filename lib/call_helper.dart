
import 'CallItemModel.dart';

class CallHelper {

  static var callList = [CallItemModel("Kashif", "Today, 2:32 PM"), CallItemModel("Asif", "Today, 6:30 PM")];

  static CallItemModel getCallItem(int position) {
    return callList[position];
  }

  static var itemCount = callList.length;

}