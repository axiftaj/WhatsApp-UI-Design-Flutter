import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(children: [
          CircleAvatar(radius: 20),
          SizedBox(width: 5,),
          Text('Name')
        ],),
        actions: const [
          Icon(Icons.call),
          SizedBox(width: 20,),
          Icon(Icons.video_call_outlined),
          SizedBox(width: 20,),

        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment:  index/ 2 != 0  ?  CrossAxisAlignment.end  : CrossAxisAlignment.start,
                  children: [
                    MessageBubble(
                      index: index,
                      message: 'Hello everyone',
                      isSeen: index/ 2 != 0 ? true : false,
                      isMe: index/ 2 != 0 ? true : false,
                      time: '23:29',
                      onPress: () {  }, listLength: 20,
                    )
                  ],
                );
              }),
            ),
            Container(
              width: double.infinity,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff9C9EB9)),
                        onChanged: (value) {
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                          hintText: 'Enter message...',
                          hintStyle: TextStyle(
                            color: Color(0xff8E8E93),
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        print('click');

                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send,
                              size: 19,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class MessageBubble extends StatelessWidget {

  MessageBubble(
      {required this.isMe,
        required this.message,
        required this.time,
        required this.onPress,
        required this.index,
        required this.listLength,
        required this.isSeen,
      });

  final bool isMe;
  final String message;
  final String time;
  final VoidCallback onPress;
  int index ;
  int listLength ;
  bool isSeen ;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: index/2 != 0 ?  CrossAxisAlignment.end  : CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment:  index/2 != 0  ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end ,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(time.toString()),
              InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  borderRadius:  index/2 != 0  ? BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10))
                      :  BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0))
                  ,
                  color: Colors.purple ,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      message,
                      style: TextStyle(
                          color:  Colors.white ,
                          fontSize: 12.0),
                    ),
                  ),
                ),
              ),

            ],
          ),
          if(isMe)
            Visibility(
              visible: index == listLength - 1 ? true : false,
              child: Text( isSeen ? 'seen' : 'Delivered'),
            ),
          SizedBox(
            height: 4,
          ),
          // Text(time.toString())
        ],
      ),
    );
  }

}