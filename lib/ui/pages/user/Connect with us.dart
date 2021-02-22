import 'package:exchange_shop/backend/server.dart';
import 'package:exchange_shop/ui/widget/ButtonWidget.dart';
import 'package:exchange_shop/ui/widget/CustomTextFiled.dart';
import 'package:exchange_shop/ui/widget/custom_contact.dart';
import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CallMe extends StatelessWidget {
  String Email;
  String phoneNumber;
  String addressComplaint;
  String Content;
  GlobalKey<FormState> callFormKey = GlobalKey();

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }
  setEmail(String value) {
    this.Email = value;
  }
  setphoneNumber(String value) {
    this.phoneNumber = value;
  }
  setaddressComplaint(String value) {
    this.addressComplaint = value;
  }
  setContent(String value) {
    this.Content = value;
  }
  saveForm() {
    if (callFormKey.currentState.validate()) {
      callFormKey.currentState.save();
      Map map={
        'Email': this.Email,
        'phoneNumber': this.phoneNumber,
        'addressComplaint': this.addressComplaint,
        'Content':this.Content

      };
      addContactUs(map);
    } else{}
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        title: Text('Contact us '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Form(
                  key: callFormKey,
                  child: Column(
                    children: [
                      WidgetContact(hint: 'Email',saveFun: setEmail,validationFun: nullValidator,),
                      WidgetContact(hint: 'Phone number',validationFun: nullValidator,saveFun: setphoneNumber,),
                      WidgetContact(hint: 'The address of the complaint',validationFun: nullValidator,saveFun: setaddressComplaint,),
                      WidgetContact(hint: 'Content',a: 20,validationFun: nullValidator,saveFun: setContent,),
                      SizedBox(height: 5,),
                      ButtonWidget(
                        onClick: () {
                          saveForm();
                           Get.back();

                        },
                        btnText: "Send",
                      ),


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
