
import 'package:flutter_whatsapp_ui/ChatItemModel.dart';

import 'ChatItemModel.dart';

class ChatHelper {

  static var chatList = [ChatItemModel("Asif Taj", "We had meeting tomorrow.", "16/09/2020"),ChatItemModel("Asif Tech", "Give me reminder", "16/09/2020"),ChatItemModel("Kashif Taj", "Learning flutter", "16/09/2020"),
  ChatItemModel("Umer", "Shine bright Like diamond", "16/09/2020"),ChatItemModel("Kash", "Ronaldo is best!", "16/09/2020")];

  static ChatItemModel getChatItem(int position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;

}
