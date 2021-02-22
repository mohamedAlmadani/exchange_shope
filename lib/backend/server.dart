import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_shop/backend/Repository.dart';
import 'package:exchange_shop/model/AppUser.dart';
import 'package:exchange_shop/model/addData.dart';
import 'package:exchange_shop/model/addNews.dart';
import 'package:exchange_shop/ui/pages/admin/add_data.dart';
import 'package:exchange_shop/ui/pages/user/News_Pages.dart';
import 'package:exchange_shop/ui/pages/user/homepage_navbar.dart';
import 'package:exchange_shop/ui/pages/user/login%20or%20register_page.dart';
import 'package:exchange_shop/ui/pages/user/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'ecchange_provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
final String collectionName = 'Users';
Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user.uid;
  } on Exception catch (e) {
    return null;
  }
}

String getUserId() {
  String userId = auth.currentUser != null ? auth.currentUser.uid : null;
  return userId;
}

signOut() async {
  await auth.signOut();
  Get.to(loginOrRigester());

}

 signInUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();
  Map map = documentSnapshot.data();
  map['userId'] = documentSnapshot.id;
  AppUser appUser = AppUser.fromMap(map);
  AddData addData = AddData.fromMap(map);
  String role = map['role'];
  Repository.repository.addData = addData;
  Repository.repository.appUser = appUser;
  Repository.repository.useroftype = appUser.type;
  if (appUser.type == userType.admin) {
    Get.off(AddDataPage());
  } else {
    Get.off(HomeNavigationBar());
  }

  // Get.to(PageMain());

  // Get.context.rootNavigator.push(Routes.mainPage);
}

Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();
  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;

  AppUser appUser = AppUser.fromMap(map);

  return appUser;
}


fetchSplachData() async {

  AppUser appUser = await getUserFromFirebase();

  Repository.repository.appUser = appUser;
  // Repository.repository.addData = addData;
}

saveUserInFirebase(Map map) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(map['Email'], map['password']);



    map.remove('password');

    await firestore.collection(collectionName).doc(userId).set({...map});



    // Get.to(PageMain());
    // Get.context.rootNavigator.push(Routes.mainPage);
  } on Exception catch (e) {
    print(e);
  }
}
fetchUserData(String userId) async {
  DocumentSnapshot documentSnapshot =
  await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  AppUser appUser = AppUser.fromMap(map);

  // Repository.repository.typeOfUser = user.type;
  Repository.repository.appUser = appUser;

  // Get.off(ProductsPage());
 }

saveData(Map map) async {
  String dataId;
 await firestore.collection('Data').doc('FxhZFj8bHw9OjqNs5dZl').update({...map});
}


Future<QuerySnapshot> getImages() {
  return firestore.collection('Data').get();
}
updateUserInFirestore() async {
  try {
    await firestore
        .collection('Data')
        .doc(auth.currentUser.uid)
        .update({
      'proundSell': 60,
      'proundBuy': 50,
      'euroSell': 50,
      'euroBuy': 50,
      'dinarSell': 50,
      'dinarBuy': 50,
      'dollarSell': 50,
      'dollarBuy': 50,
    }).then((value) => print('success'));

  } on Exception catch (e) {
    print(e);
  }
}

GetData(String userId) async {
  try {
    QuerySnapshot querySnapshot = await firestore.collection('Data').get();
    List<AddData> AddDatas = querySnapshot.docs.map((e) {
      Map map = e.data();
      print(querySnapshot.docs);
      map['userId'] = e.data();
      return AddData.fromMap(map);
    }).toList();
    Provider.of<ExchangeShope>(Get.context, listen: false).setData(AddDatas);
  } on Exception catch (e) {
    print(e);
  }
}

addNewData(Map map) async {
  try {
    await firestore
        .collection('Data')
        .doc(Repository.repository.addData.dataId)
        .set({...map});
  } on Exception catch (e) {
    print(e);
  }
  // Get.back();
}
// updateUserInFirestorenew(Map map) async {
//   try {
//     await firestore
//         .collection('Data')
//         .doc()
//         .update({...map});
//   } on Exception catch (e) {
//     print(e);
//   }
// }

// fetchdat() async{
//   QuerySnapshot querySnapshot = await firestore.collection(collectionName).doc(Repository.repository.appUser.userId).collection('Data').get();
//   List<AddData> AddDatas =querySnapshot.docs.map((e)  {
//     Map map =e.data();
//     map['dataId'] =e.data();
//     return AddData.fromMap(map);
//
//
//
//   }).toList();
//
//   Provider.of<ExchangeShope>(Get.context,listen: false).setData(AddDatas);
//
//
// }
// addNewProduct(Map map) async {
//   // String productImageUrl = await uploadImage(map['file'], true);
//   // map.remove('file');
//   // map['imageUrl'] = productImageUrl;
//   CollectionReference collectionReference =await firestore.collection('Data');
//   collectionReference.add({...map});
//   Get.back();
// }
// GetALLData() async{
//   QuerySnapshot querySnapshot = await firestore
//       .collection(collectionName)
//       .where('role', isEqualTo: 'admin')
//       .get();
//   List<News> news = querySnapshot.docs.map((e) {
//     Map map =e.data();
//     map['newsId'] =e.id;
//     return News.fromMap(map);
//   }).toList();
//   Provider.of<ExchangeShope>(Get.context,listen: false).setnews(news);
//
//
// }
// Future<AddData> getdataFromFirebase() async {
//   DocumentSnapshot documentSnapshot = await firestore
//       .collection('Data')
//       .doc(Repository.repository.appUser.userId)
//       .get();
//   Map map = documentSnapshot.data();
//
//   AddData addData = AddData.fromMap(map);
//
//   return addData;
// }

addNewNews(Map map) async {
  try {
    String productImageUrl = await uploadImage(map['file']);
    map.remove('file');
    map['imageUrl'] = productImageUrl;
    CollectionReference collectionReference = await firestore.collection('News');
    collectionReference.add({...map});
  } on Exception catch (e) {
    print(e);
  }
 // Get.to(NewsPage());

}
addContactUs(Map map) async{
  CollectionReference collectionReference = await firestore.collection('ContactUs');
  collectionReference.add({...map});
//  Get.to(NewsPage());
}

GetAllMarketProductFromFirebase(String newsId) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('Producs')
      .doc(newsId)
      .collection('News')
      .get();
  List<News> news = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['newsId'] = e.data();
    return News.fromMap(map);
  }).toList();
  Provider.of<ExchangeShope>(Get.context, listen: false).setnews(news);
}

Future<String> uploadImage(File file) async {
  String fileName = file.path.split('/').last;
  String folderName = 'productImag';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}
