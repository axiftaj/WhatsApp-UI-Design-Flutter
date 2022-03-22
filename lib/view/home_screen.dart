import 'package:flutter/material.dart';
import 'package:whatsapp/setting_screen.dart';
import 'package:whatsapp/view/calls_view.dart';
import 'package:whatsapp/view/chat_list_view.dart';
import 'package:whatsapp/view/status_view.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

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
              fabIcon = Icons.chat;
              break;
            case 2:
              fabIcon = Icons.camera_alt_outlined;
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
        title:   Text(
          "WhatsApp",
          style:   Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
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
                  child: Text("New Group" ,  ),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("Linked devices") ,
                  value: 2,
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
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
              child: Text("CHATS"),
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
        children: const [
          Icon(Icons.camera_alt),
          ChatListView(),
          StatusScreen(),
          CallsView(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }
}
