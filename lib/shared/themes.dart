import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const defaultMe=Colors.deepPurple;
const defaultYou=Colors.deepPurple;
ThemeData lightTheme = ThemeData(
    //primarySwatch: defaultYou,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.orangeAccent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black)),
    primaryColorLight: Colors.white10
    //fontFamily: 'jannahFont'
);

ThemeData darkTheme = ThemeData(
    //primarySwatch: defaultMe,
    floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
          backgroundColor: defaultMe,


      ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 50.0,
      unselectedItemColor: Colors.white,
      selectedItemColor: defaultMe,
      type:
          BottomNavigationBarType.fixed, //مهم جداااااااااااااااااااااااااااااا
    ),
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme:  const AppBarTheme(

        systemOverlayStyle: SystemUiOverlayStyle(

            statusBarColor: Colors.black,

            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.black54,
        elevation: 0.0,

        titleTextStyle:  TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
        bodyText1:  TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
        bodyText2:  TextStyle(
            fontSize: 18,  color: Colors.white),
    ),


  //fontFamily: 'jannahFont'
);
