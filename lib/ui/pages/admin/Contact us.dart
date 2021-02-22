import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
class AdminContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        title: Text('view ContactUs '),
        centerTitle: true,

      ),
      body:  StreamBuilder(
        stream: firestore.collection('ContactUs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');

            default:
              int cardLength = snapshot.data.docs.length;

              return new ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(color: blueColors),


                itemCount:cardLength ,
                itemBuilder: (int ,index){
                  DocumentSnapshot document= snapshot.data.docs[index];
                  return Column(
                    children: [
                      ListTile(
                        leading:Column(
                          children: [
                            Text(document['Email']),
                            Text(document['phoneNumber']),

                          ],
                        ) ,
                        title: Column(
                          children: [
                            Text(document['addressComplaint']),
                            Text(document['Content']),
                          ],
                        ),
                      )

                    ],
                  );



                },

              );
          }
        },
      ),
    );
  }
}
