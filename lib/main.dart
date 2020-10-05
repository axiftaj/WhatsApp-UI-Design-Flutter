import 'package:flutter/material.dart';

import 'CallHelper.dart';
import 'CallItemModel.dart';
import 'ChatHelper.dart';
import 'ChatItemModel.dart';
import 'StatusHelper.dart';
import 'StatusItemModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Color whatsAppGreen = Color.fromRGBO(18, 140, 126, 1.0);
  // Color whatsAppGreenLight = Color.fromRGBO(37, 211, 102, 1.0);

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              fabIcon = Icons.message;
              break;
            case 1:
              fabIcon = Icons.camera_enhance;
              break;
            case 2:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff101d25),
      appBar:  AppBar(
        backgroundColor: Color(0xff232d36),
        title:  Text(
          "WhatsApp",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          labelColor: Color(0xff23a695),
          tabs: [

            Tab(
              child: Text("CHATS" ,

              ),
            ),
            Tab(
                child: Text(
                  "STATUS",
                )),
            Tab(
                child: Text(
                  "CALLS",
                )),
          ],
          unselectedLabelColor: Color(0xff878e94),

          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemBuilder: (context, position) {
              ChatItemModel chatItem = ChatHelper.getChatItem(position);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                       CircleAvatar(
                         radius: 36,
                         backgroundImage: AssetImage('images/asif.png'),

                       ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.name,
                                      style: TextStyle(
                                          color: Color(0xffd6dbdc),
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      chatItem.messageDate,
                                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    chatItem.mostRecentMessage,
                                    style: TextStyle(
                                        color: Color(0xff7a8388),
                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
          ),
          ListView.builder(
            itemBuilder: (context, position) {
              StatusItemModel statusItemModel = StatusHelper.getStatusItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('images/asif.png'),

                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      statusItemModel.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff7a8388),

                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    statusItemModel.dateTime,
                                    style: TextStyle(
                                        color: Color(0xff7a8388),

                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: StatusHelper.itemCount,
          ),
          ListView.builder(
            itemBuilder: (context, position) {
              CallItemModel callItemModel = CallHelper.getCallItem(position);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('images/asif.png'),

                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          callItemModel.name,
                                          style: TextStyle(
                                              color: Color(0xff7a8388),

                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Text(
                                        callItemModel.dateTime,
                                        style: TextStyle(
                                            color: Color(0xff7a8388),

                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.call , color: Color(0xff00b09c),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: CallHelper.itemCount,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }
}
