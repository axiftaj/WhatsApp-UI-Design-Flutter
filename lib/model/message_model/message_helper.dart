
import 'package:whatsapp/model/message_model/message_model.dart';



class MessageHelper {

  static var messageList = [
    MessageItemModel("John wick", "We had meeting tomorrow.", "10:28 PM" , "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg" , "msj"),
    MessageItemModel("John Alia", "https://cdn.pixabay.com/photo/2021/03/02/16/34/woman-6063087_960_720.jpg", " 10:28 AM", "https://cdn.pixabay.com/photo/2021/03/02/16/34/woman-6063087_960_720.jpg", "image"),
    MessageItemModel("Ema watson", "https://cdn.pixabay.com/photo/2021/03/02/16/34/woman-6063087_960_720.jpg", "Yesterday" , "https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg" , "image"),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg" , "msj"),
    MessageItemModel("Ronaldo", "Ronaldo is best!", "16/01/2022", "https://cdn.pixabay.com/photo/2021/05/01/09/59/city-6220689_960_720.jpg", "msj"),
    MessageItemModel("Tom hardy", "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg", "image" ),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg" , "msj"),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg" , "msj"),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg" , "msj"),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg" , "msj"),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg", "msj" ),
    MessageItemModel("Tom hardy", "Shine bright Like diamond", "Wednesday" , "https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg", "msj" ),

  ];

  static MessageItemModel getCHatList(int position) {
    return messageList[position];
  }

  static var itemCount = messageList.length;

}