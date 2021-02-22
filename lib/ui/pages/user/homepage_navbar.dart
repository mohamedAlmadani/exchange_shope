import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:exchange_shop/backend/Repository.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/main.dart';
import 'package:exchange_shop/ui/pages/user/News_Pages.dart';
import 'package:exchange_shop/ui/pages/user/page_main.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:exchange_shop/ui/widget/CustomViewEcchange.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'About the application.dart';

class HomeNavigationBar extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeNavigationBar> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;
  static  List<Widget> _options = <Widget>[
    HomePage(),
    NewsPage(),
    AboutTheApplication(),
   Text('Settings Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Appbar,
         height: 60.h,
       animationCurve:Curves.easeIn,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30,  color: blueColors,),
          Icon(
            Icons.report,
            color: blueColors,

          ),
           Icon(Icons.info_outline_rounded, size: 30,  color: blueColors,),
        ],

        onTap: _onItemTap,
        index:_selectedIndex ,



      ),

      body:_options.elementAt(_selectedIndex),
    );
  }
}

