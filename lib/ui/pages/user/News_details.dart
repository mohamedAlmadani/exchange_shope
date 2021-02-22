import 'package:exchange_shop/model/addNews.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color color = Color(0xff59c2ff);
String img =
    "https://i.pinimg.com/originals/77/d6/79/77d679bb5ba328796061202510f30bf2.jpg";

class NewsAppConceptDetails extends StatelessWidget {
  News news;
  NewsAppConceptDetails(this.news);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(

        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: width,
            height: height * .4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:NetworkImage(news.imageUrl),
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * .4) - 35,
            right: 20,
            width: 70,
            height: 70,
            child: FloatingActionButton(
              heroTag: 'hh',
              onPressed: () {},
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite,
                color: Color(0xffff8993),
                size: 35,
              ),
            ),
          ),
          Positioned(
            top: 18,
            right: 330,
            width: 70,
            height: 70,
            child:IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: blueColors,
            )
          ),
          Positioned(
            top: (height * .4) + 35,
            left: 0,
            width: width,
            height: (height * .6) - 35,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[



                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        news.description,
                        style: GoogleFonts.palanquin(
                            fontSize: 16, fontWeight: FontWeight.bold
                        ),

                        textAlign: TextAlign.justify,

                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 220.0,
// //  width: double.infinity,
// alignment: Alignment.center,
// margin: EdgeInsets.only(top: 10),
// child: Image.network(
// news.imageUrl,
// fit: BoxFit.fill,
//
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// ),
// ),
// Container(
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(news.description),
//
// ],
// ),
// )
// ],
// ) ,
