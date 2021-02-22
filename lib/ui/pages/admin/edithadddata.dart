import 'package:exchange_shop/backend/Repository.dart';
import 'package:exchange_shop/ui/pages/user/page_main.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/Custom_add_data.dart';
import 'package:flutter/material.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:get/get.dart';
class EdithData extends StatelessWidget {
  GlobalKey<FormState> edithDataFormKey = GlobalKey();
  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  String newdollarSell;
  String newdollarBuy;
  String neweuroSell;
  String neweuroBuy;
  String newdinarSell;
  String newdinarBuy;
  String newproundSell;
  String newproundBuy;
  String dataId;
  setProundSell(String value) {
    this.newproundSell = value;
  }

  setProundBuy(String value) {
    this.newproundBuy = value;
  }

  setEuroSell(String value) {
    this.neweuroSell = value;
  }

  setEuroBuy(String value) {
    this.neweuroBuy = value;
  }

  setDinarSell(String value) {
    this.newdinarSell = value;
  }

  setDinarBuy(String value) {
    this.newdinarBuy = value;
  }

  setDollarSell(String value) {
    this.newdollarSell = value;
  }

  setDollarBuy(String value) {
    this.newdollarBuy = value;
  }
  // UpdateUser() {
  //   if (edithDataFormKey.currentState.validate()) {
  //     edithDataFormKey.currentState.save();
  //     // Map map = {
  //     //
  //     //   'proundSell': this.newproundSell,
  //     //   'proundBuy': this.newproundBuy,
  //     //   'euroSell': this.neweuroSell,
  //     //   'euroBuy': this.neweuroBuy,
  //     //   'dinarSell': this.newdinarSell,
  //     //   'dinarBuy': this.newdinarBuy,
  //     //   'dollarSell': this.newdollarSell,
  //     //   'dollarBuy': this.newdollarBuy,
  //     //
  //     // };
  //     updateUserInFirestore();
  //     Get.to(HomePage());
  //   }
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: edithDataFormKey,
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
                    Get.to(HomePage());
                  },
                  btnText: "edith Data",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
