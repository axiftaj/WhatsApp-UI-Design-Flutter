
import 'ChatItemModel.dart';

class ChatHelper {

  static var chatList = [
    ChatItemModel("John wick", "We had meeting tomorrow.", "10:28 PM"),
    ChatItemModel("John Alia", "Give me reminder", " 10:28 AM"),
    ChatItemModel("Asif Taj", "Learning flutter and node", "Yesterday"),
    ChatItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday"),
    ChatItemModel("Ronaldo", "Ronaldo is best!", "16/01/2022")];

  static ChatItemModel getChatItem(int position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;

}