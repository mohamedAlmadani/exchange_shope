import 'dart:io';

import 'package:exchange_shop/model/addData.dart';
import 'package:exchange_shop/model/addNews.dart';
import 'package:flutter/cupertino.dart';

class ExchangeShope extends ChangeNotifier{
  List<AddData> AddDatas =[];
  setData(List<AddData> value){
    this.AddDatas=value;
    notifyListeners();

  }
  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
  List<News> news=[];
  setnews(  List<News> value){
    this.news=value;
    notifyListeners();
  }




}