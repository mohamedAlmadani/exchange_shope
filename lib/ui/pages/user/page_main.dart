import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_shop/backend/ecchange_provider.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/model/addData.dart';
import 'package:exchange_shop/ui/pages/admin/edithadddata.dart';
import 'package:exchange_shop/ui/pages/user/customDrawer.dart';
import 'package:exchange_shop/ui/widget/CustomViewEcchange.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        title: Text('Home '),
        centerTitle: true,

      ),
      body:
      StreamBuilder(
        stream: firestore.collection('Data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return SingleChildScrollView(
                child: Column(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return Column(
                      children: [
                        viewExchange(
                          flgother: 'assets/images/united.svg',
                          numberbuy: document['dollarBuy'],
                          numberseel: document['dollarSell'],
                          ecchange: 'Dollar',
                        ),
                        viewExchange(
                          flgother: 'assets/images/european.svg',
                          numberbuy: document['euroBuy'],
                          numberseel: document['euroSell'],
                          ecchange: 'Euro',
                        ),
                        viewExchange(
                          flgother: 'assets/images/jordan.svg',
                          numberbuy: document['dinarBuy'],
                          numberseel: document['dinarSell'],
                          ecchange: 'Dinar',
                        ),
                        viewExchange(
                          flgother: 'assets/images/egypt.svg',
                          numberbuy: document['proundBuy'],
                          numberseel: document['proundSell'],
                          ecchange: 'Pound ',
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
          }
        },
      ),


    );
  }
}




// Selector<ExchangeShope, List<AddData>>(
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
// // Container(
// //   height: 100,
// //   width: 100,
// //   child: Image.network(
// //     value[index].imageUrl??'hhh',
// //     fit: BoxFit.cover,
// //   ),
// // ),
// Column(
// children: [
// Text(value[index].euroBuy??'1'),
// Text(value[index].dinarBuy??'1'),
// Text(value[index].proundSell??'1'),
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
// return y.AddDatas;
// },
// ),

// FutureBuilder(
// future: getImages(),
// builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (snapshot.connectionState == ConnectionState.done) {
// return ListView.builder(
// shrinkWrap: true,
// itemCount: snapshot.data.docs.length,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(
// contentPadding: EdgeInsets.all(8.0),
// title: Text(snapshot.data.docs[index].data()["dinarBuy"]),
// subtitle: Text(snapshot.data.docs[index].data()["euroBuy"]),
// // leading: Image.network(
// //     snapshot.data.docs[index].data()["url"],
// //     fit: BoxFit.fill),
// );
// });
// } else if (snapshot.connectionState == ConnectionState.none) {
// return Text("No data");
// }
// return CircularProgressIndicator();
// },
// )