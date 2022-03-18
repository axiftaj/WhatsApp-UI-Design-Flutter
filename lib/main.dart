import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/call_helper.dart';
import 'package:whatsapp/chat_screen.dart';
import 'package:whatsapp/setting_screen.dart';
import 'package:whatsapp/theme_changer.dart';
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

    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(),
        child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return  MaterialApp(
            title: 'Flutter Demo',
            home:  MyHomePage(),
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.teal
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            debugShowCheckedModeBanner: false,
          );

        })
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

  late TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              fabIcon = Icons.camera_alt_outlined;
              break;
            case 1:
              fabIcon = Icons.camera_enhance;
              break;
            case 2:
              fabIcon = Icons.call;
              break;
            case 2:
              fabIcon = Icons.message;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  AppBar(
        title:  const Text(
          "WhatsApp",
        ),
        actions:  <Widget>  [

           Padding(
            padding:  EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          PopupMenuButton(
            enabled: true,
              icon: Icon(Icons.more_vert_outlined),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("First"),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("First") ,
                  value: 2,
                ),
                 PopupMenuItem(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
                      },
                      child: Text("Setting")) ,
                  value: 2,
                )
              ]
          ),

        ],
        bottom:  TabBar(
          tabs: const [
            Tab(
                child: Icon(Icons.camera_alt)),
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

          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Icon(Icons.camera_alt),
          ListView.builder(
            itemBuilder: (context, position) {
              ChatItemModel chatItem = ChatHelper.getChatItem(position);
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('images/asif.png'),
                      ),
                      title:  Text(
                        chatItem.name,
                      ),
                      subtitle: Text(
                        chatItem.mostRecentMessage,

                      ) ,
                      trailing:Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          chatItem.messageDate,
                        )  ,

                    ),),
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
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('images/asif.png'),
                    ),
                    title:  Text(
                      statusItemModel.name,
                    ),
                    subtitle: Text(
                      statusItemModel.name+", "+statusItemModel.dateTime,
                    ) ,
                   ),
                  const Divider(),
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
                        const CircleAvatar(
                          radius: 28,
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

                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Text(
                                        callItemModel.dateTime,

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