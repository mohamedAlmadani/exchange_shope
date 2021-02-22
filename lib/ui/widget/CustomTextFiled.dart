import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  IconData icon;
  Function validationFun;
  Function saveFun;
  CustomTextField({this.hint, this.saveFun, this.validationFun, this.icon});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: blueColors),
      child: Column(
        children: [
          Card(
            elevation: 2,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,

              ),
              padding: EdgeInsets.only(left: 10),


              child: TextFormField(

                onSaved: (value){
                  saveFun(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,


                  hintText: hint,
                  prefixIcon: Icon(icon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
