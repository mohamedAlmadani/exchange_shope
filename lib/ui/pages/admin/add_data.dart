import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/ui/pages/admin/Contact%20us.dart';
import 'package:exchange_shop/ui/pages/admin/add_news.dart';
import 'package:exchange_shop/ui/pages/user/News_Pages.dart';
import 'package:exchange_shop/ui/pages/user/page_main.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/Custom_add_data.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDataPage extends StatelessWidget {
  String dollarSell;
  String dollarBuy;
  String euroSell;
  String euroBuy;
  String dinarSell;
  String dinarBuy;
  String proundSell;
  String proundBuy;
  String dataId;
  setProundSell(String value) {
    this.proundSell = value;
  }

  setProundBuy(String value) {
    this.proundBuy = value;
  }

  setEuroSell(String value) {
    this.euroSell = value;
  }

  setEuroBuy(String value) {
    this.euroBuy = value;
  }

  setDinarSell(String value) {
    this.dinarSell = value;
  }

  setDinarBuy(String value) {
    this.dinarBuy = value;
  }

  setDollarSell(String value) {
    this.dollarSell = value;
  }

  setDollarBuy(String value) {
    this.dollarBuy = value;
  }

  GlobalKey<FormState> newDataFormKey = GlobalKey();
  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  saveForm() {
    if (newDataFormKey.currentState.validate()) {
      newDataFormKey.currentState.save();
      Map map = {
        'proundSell': this.proundSell,
        'proundBuy': this.proundBuy,
        'euroSell': this.euroSell,
        'euroBuy': this.euroBuy,
        'dinarSell': this.dinarSell,
        'dinarBuy': this.dinarBuy,
        'dollarSell': this.dollarSell,
        'dollarBuy': this.dollarBuy,
      };
      saveData(map );
      Get.to(HomePage());
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: CircleAvatar(
                  backgroundColor: Appbar,
                  radius: 50.0,
                  backgroundImage:AssetImage( 'assets/images/logo.png')


              ),
            ),
            SizedBox(height: 20.h,),
            ListTile(
              onTap: (){
                Get.to(AddNewsPages());
              },
        leading: Text('add news'),
             trailing : Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: (){
                Get.to(AdminContactUs());
              },
              leading: Text('ContactUs'),
              trailing : Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: (){
                Get.to(HomePage());
              },
              leading: Text('Home Page'),
              trailing : Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Add data '),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signOut();
              })
        ],
      ),
      body: Form(
        key: newDataFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAddData(
                text: 'Dollar sell',
                validateFun: nullValidator,
                saveFun: setDollarSell,
              ),
              CustomAddData(
                text: 'Dollar buy',
                validateFun: nullValidator,
                saveFun: setDollarBuy,
              ),
              CustomAddData(
                text: 'Euro sell',
                validateFun: nullValidator,
                saveFun: setEuroSell,
              ),
              CustomAddData(
                text: 'Euro buy',
                validateFun: nullValidator,
                saveFun: setEuroBuy,
              ),
              CustomAddData(
                text: 'Dinar sell',
                validateFun: nullValidator,
                saveFun: setDinarSell,
              ),
              CustomAddData(
                text: 'Dinar buy',
                validateFun: nullValidator,
                saveFun: setDinarBuy,
              ),
              CustomAddData(
                text: 'Pound sell',
                validateFun: nullValidator,
                saveFun: setProundSell,
              ),
              CustomAddData(
                text: 'Pound buy',
                validateFun: nullValidator,
                saveFun: setProundBuy,
              ),
              Center(
                child: ButtonWidget(
                  onClick: () {
                    saveForm();
                  },
                  btnText: "Add Data",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
