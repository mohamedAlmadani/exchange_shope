import 'package:flutter/material.dart';
class AddData{
  String dataId;
  String dollarSell;
  String dollarBuy;
  String euroSell;
  String euroBuy;
  String dinarSell;
  String dinarBuy;
  String proundSell;
  String proundBuy;

  AddData({this.dinarBuy,this.dinarSell,this.dollarBuy,this.dollarSell,this.euroBuy,this.euroSell,this.proundBuy,this.proundSell,this.dataId});
  AddData.fromMap(Map map){
    this.proundSell=map['proundSell'];
    this.proundBuy=map['proundBuy'];
    this.euroSell=map['euroSell'];
    this.euroBuy=map['euroBuy'];
    this.dinarSell=map['dinarSell'];
    this.dinarBuy=map['dinarBuy'];
    this.dollarSell=map['dollarSell'];
    this.dollarBuy=map['dollarBuy'];
    this.dataId=map['dataId'];

  }
  toJson(){
    return {
      'proundSell':  this.proundSell,
      'proundBuy':  this.proundBuy,
      'euroSell': this.euroSell,
      'euroBuy': this.euroBuy,
      'dinarSell': this.dinarSell,
      'dinarBuy':  this.dinarBuy,
      'dollarSell':  this.dollarSell,
      'dollarBuy':   this.dollarBuy,


    };
  }

}