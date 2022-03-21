
import 'CallItemModel.dart';

class CallHelper {

  static var callList = [
    CallItemModel("Kashif", "Outgoing Today, 2:32 PM", "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg"),
    CallItemModel("Asif", "Incoming, 6:30 PM" , "https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490_960_720.jpg")

  ];

  static CallItemModel getCallItem(int position) {
    return callList[position];
  }

  static var itemCount = callList.length;

}