import 'package:shared_preferences/shared_preferences.dart';

class CoreService {
  Future<bool> getLogStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getString('email');
    if (prefs.getString('email') != null) {
      return true;
    } else {
      return false;
    }
    //prefs.remove('email')
    //prefs.getString('email','@bhh.com')
  }

  Future addEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    //prefs.remove('email')
    //prefs.getString('email','@bhh.com')
  }

  Future removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    //prefs.getString('email','@bhh.com')
  }
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // Future intialise() async {
  //    await Firebase.initializeApp();
  // }
}

/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_complete_guide/screens/auth_screen.dart';
import 'package:flutter_complete_guide/screens/chat_screen.dart';
import 'package:flutter_complete_guide/screens/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            title: 'FlutterChat',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              backgroundColor: Colors.pink,
              accentColor: Colors.deepPurple,
              accentColorBrightness: Brightness.dark,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            home: appSnapshot.connectionState != ConnectionState.done
                ? SplashScreen()
                : StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return SplashScreen();
                      }
                      if (userSnapshot.hasData) {
                        return ChatScreen();
                      }
                      return AuthScreen();
                    }),
          );
        });*/
