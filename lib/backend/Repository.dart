import 'package:exchange_shop/model/AppUser.dart';
import 'package:exchange_shop/model/AppUser.dart';
import 'package:exchange_shop/model/addData.dart';
import 'package:exchange_shop/model/addNews.dart';

class Repository{
  Repository._();
  static Repository repository =Repository._();
  AppUser appUser;
  userType useroftype;
  AddData addData;
  News news;
}