import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/ui/pages/user/News_Pages.dart';
import 'package:exchange_shop/ui/pages/user/homepage_navbar.dart';
import 'package:exchange_shop/ui/pages/user/login%20or%20register_page.dart';
import 'package:exchange_shop/ui/pages/user/loginPage.dart';
import 'package:exchange_shop/ui/pages/user/register_page.dart';
import 'package:exchange_shop/ui/widget/CustomViewEcchange.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'backend/ecchange_provider.dart';
import 'ui/pages/user/Connect with us.dart';

void main()  {


  runApp(ChangeNotifierProvider<ExchangeShope>(
      create: (context) {
        return ExchangeShope();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        theme: ThemeData(

        ),
        title: 'Exchange shop ',
        home: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return splachScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class splachScreen extends StatefulWidget {
  @override
  _splachScreenState createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {
  String userId;
  @override
  void initState() {
    userId = getUserId();
    if (userId != null) {
      fetchSplachData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      userId == null
          ? Get.off((loginOrRigester()))
          : Get.off(HomeNavigationBar());
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [blueColors, blueLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
