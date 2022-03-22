import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/constand/constants.dart';
import 'package:whatsapp/theme_changer.dart';
import 'package:whatsapp/view/home_screen.dart';

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
            home:  HomeScreen(),
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
                color: Colors.grey.shade600
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
              color: Colors.grey
          )
            ),
            debugShowCheckedModeBanner: false,
          );

        })
    );
  }
}

