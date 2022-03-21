import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/model/call_model/call_helper.dart';
import 'package:whatsapp/chat_screen.dart';
import 'package:whatsapp/constand/constants.dart';
import 'package:whatsapp/setting_screen.dart';
import 'package:whatsapp/theme_changer.dart';
import 'package:whatsapp/view/calls_view.dart';
import 'package:whatsapp/view/chat_list_view.dart';
import 'package:whatsapp/view/status_view.dart';
import 'model/call_model/CallItemModel.dart';
import 'model/chat_model/ChatHelper.dart';
import 'model/chat_model/ChatItemModel.dart';
import 'model/status_model/StatusHelper.dart';
import 'model/status_model/StatusItemModel.dart';

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
              primarySwatch: Colors.teal,
              textTheme: const TextTheme(
                  headline3: TextStyle(fontFamily: 'Bold', fontSize: 20.0,color: Colors.black ),
                  headline4: TextStyle(fontFamily: 'Bold', fontSize: 18.0,color: Color(0xff25292B) ),
                  headline5: TextStyle(fontFamily: Bold,fontSize: 16.0,color: Color(0xff25292B) ),
                  headline6: TextStyle(fontFamily: Bold, fontSize: 14.0,color: Color(0xff25292B)),
                  bodyText1: TextStyle(fontFamily: Regular, fontSize: 12.0, color: Color(0xff25292B)),
                  bodyText2: TextStyle(fontFamily: Regular, fontSize: 10.0, color:Color(0xff25292B)),
              ),
                iconTheme: IconThemeData(
                color: Colors.blue
          ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
                textTheme: const TextTheme(
                    headline3: TextStyle(fontFamily: 'Bold', fontSize: 20.0,color: Colors.white ),
                    headline4: TextStyle(fontFamily: 'Bold', fontSize: 18.0,color: Colors.white ),
                    headline5: TextStyle(fontFamily: Bold,fontSize: 16.0, color: Colors.white),
                    headline6: TextStyle(fontFamily: Bold, fontSize: 14.0,color: Colors.white),
                    bodyText1: TextStyle(fontFamily: Regular, fontSize: 12.0, color: Colors.white),
                    bodyText2: TextStyle(fontFamily: Regular, fontSize: 10.0,color: Colors.white),
                ),
          iconTheme: IconThemeData(
              color: Colors.blue)
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
                  child: Text("First" ,  ),
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