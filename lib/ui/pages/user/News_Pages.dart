import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_shop/model/addNews.dart';
import 'package:exchange_shop/ui/pages/user/News_details.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        backgroundColor: Appbar,
        title: Text('News '),
        centerTitle: true,
       

      ),
      body: StreamBuilder(
        stream: firestore.collection('News').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');

            default:
              int cardLength = snapshot.data.docs.length;

              return new ListView.builder(
                itemCount: cardLength,
                itemBuilder: (int, index) {
                  DocumentSnapshot document = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      News news = News.fromMap(document.data());
                      Get.to(NewsAppConceptDetails(news));
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(document['imageUrl']??CircularProgressIndicator()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 135,
                          width: 90,
                          margin: EdgeInsets.only(left: 10, top: 10),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          document['newsName'],
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.fade,
                        )),
                      ],
                    ),
                  );
                },
              );
          }
        },
      ),
    );

    // new ListTile(
    //   title: Text(document['newsName']),
    //   subtitle: Text(document['newsDescription']),
    // );
  }
}


// Selector<ExchangeShope, List<News>>(
// builder: (context, value, child) {
// return value.isEmpty?Center(child: CircularProgressIndicator(),):
// ListView.builder(
// itemCount: value.length,
// itemBuilder: (context, index) {
// return GestureDetector(
// onTap:(){
// // Get.to(ProductDeatails(value[index]));
// } ,
// child: Container(
// child: Row(
// children: [
// Container(
// height: 100,
// width: 100,
// child: Image.network(
// value[index].imageUrl??'hhh',
// fit: BoxFit.cover,
// ),
// ),
// Column(
// children: [
// Text(value[index].Name??''),
//
// Text(value[index].description??''),
//
//
// ],
// )
// ],
// ),
// ),
// );
// },
// );
// },
// selector: (x, y) {
// return y.news;
// },
// ),
