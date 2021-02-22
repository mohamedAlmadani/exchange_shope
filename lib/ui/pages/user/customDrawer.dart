import 'package:exchange_shop/backend/Repository.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'About the application.dart';
import 'Connect with us.dart';
import 'News_Pages.dart';



class CustomDrawer extends StatelessWidget {
  _launchURLinstagram() async {
    const url = 'https://www.instagram.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLfacebook() async {
    const url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // UserAccountsDrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Color(0xff6bc8c6),
            //   ),
            //
            //
            //   accountName:CircleAvatar(
            //     radius: 50,
            //     child: Text(Repository.repository.appUser.Name[0].toUpperCase()),
            //   ) ,
            // )
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,


                    children: [
                      CircleAvatar(
                        backgroundColor: Appbar,
                        radius: 50.0,
                          backgroundImage:AssetImage( 'assets/images/logo.png')


                      ),

                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 20.0.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: (){
                    _launchURLinstagram();

                  },
                  child: SvgPicture.asset(
                    'assets/images/instagram.svg',
                    height: 30.h,
                    width: 30.w,

                  ),
                ),
                FlatButton(
                  onPressed: (){
                    _launchURLfacebook();
                  },
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    height: 30.h,
                    width: 30.w,

                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: SvgPicture.asset(
                    'assets/images/web.svg',
                    height: 30.h,
                    width: 30.w,

                  ),
                ),



              ],
            ),
            SizedBox(
              height: 10.0.h,
            ),
            ListTile(
              onTap: () {
                Get.to(NewsPage());
              },
              leading: Icon(
                Icons.report,
                color: blueColors,

              ),


              // Image.asset(
              //   'assets/images/news.jpg',
              //    color: blueColors,
              //
              //   fit: BoxFit.cover,
              //
              //
              //
              //   width: 38,
              //   height: 38,
              // ),
              title: Text("Economic News"),
            ),
            ListTile(
              onTap: () {
                Get.to(AboutTheApplication());
              },
              leading: Icon(
                Icons.info_outline_rounded,
                color: blueColors,

              ),
              title: Text("About The Application"),
            ),



            ListTile(
              onTap: () {
                Get.to(CallMe());
              },
              leading: Icon(
                Icons.mark_chat_unread_sharp,
                color: blueColors,

              ),
              title: Text("Contact us"),
            ),
            ListTile(
              onTap: () {

                final RenderBox box = context.findRenderObject();
                Share.share("Share is this",
                    subject:"this is the subject",
                    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              },
              leading: Icon(
                Icons.share,
                color: blueColors,

              ),
              title: Text("Share"),
            ),
            ListTile(
              onTap: () {
                signOut();

              },
              leading: Icon(
                Icons.logout ,
                color: blueColors,

              ),
              title: Text("logout "),
            ),





          ],
        ),
      ),
    );
  }
}


