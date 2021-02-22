import 'package:flutter/material.dart';
class CustomAddData extends StatelessWidget {
  String text;
  Function saveFun;
  Function validateFun;
  CustomAddData({this.text,this.saveFun,this.validateFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            Text(this.text,style: TextStyle(color: Colors.black87,fontSize: 15),),
            SizedBox(width: 10,),
            Expanded(child: TextFormField(
              onSaved: (value) {
                this.saveFun(value);
              },
              validator: (value) {
                this.validateFun(value);
              },
            )),
          ],
        ),
      ),
    );
  }
}
