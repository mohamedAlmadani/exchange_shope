import 'dart:io';

import 'package:exchange_shop/backend/ecchange_provider.dart';
import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/ui/pages/user/News_Pages.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/CustomTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class AddNewsPages extends StatelessWidget {
  String imageUrl;
  String Name;
  String description;
  GlobalKey<FormState> newsFormKey = GlobalKey();

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  setnewsName(String value) {
    this.Name = value;
  }

  setdescriptionnews(String value) {
    this.description = value;
  }

  saveForm() {
    if (newsFormKey.currentState.validate()) {
      newsFormKey.currentState.save();
      Map map ={
        'newsName':this.Name,
        'newsDescription':this.description,
        'file':Provider.of<ExchangeShope>(Get.context,listen: false).file,

      };

      addNewNews(map);
     // Get.to(NewsPage());

    }
    else{
      return;
    }
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add news'),
        ),
        body: Form(
          key: newsFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Selector<ExchangeShope, File>(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () async {
                          PickedFile pickedFile = await ImagePicker().getImage(
                              source: ImageSource.gallery);
                          File file = File(pickedFile.path);
                          Provider.of<ExchangeShope>(context, listen: false)
                              .setFile(file);
                        },
                        child: Container(
                          color: Colors.grey[200],
                          height: 200,
                          width: 200,
                          child: value != null ? Image.file(value,
                            fit: BoxFit.cover,) : Icon(Icons.add),
                        ),
                      );
                    }, selector: (x, y) {
                  return y.file;
                }),
                CustomTextField(
                  hint: 'news name',
                  saveFun: setnewsName,
                  validationFun: nullValidator,
                ),
                CustomTextField(
                  hint: 'news description',
                  saveFun: setdescriptionnews,
                  validationFun: nullValidator,
                ),
                Center(
                  child: ButtonWidget(
                    onClick: ()  async{
                      await saveForm();
                      Get.to(NewsPage());
                    },
                    btnText: "Add news",
                  ),
                ),


              ],
            ),
          ),
        ),


      );
    }

}
