import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class viewExchange extends StatelessWidget {

String ecchange;
  String flgother;
  String numberseel;
  String numberbuy;
  viewExchange({this.flgother,this.ecchange,this.numberbuy,this.numberseel});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 737.4545454545455,
        allowFontScaling: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,

            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
              alignment: Alignment.center,
              height: 90.h,
              width: double.infinity,
              child: ListTile(
                trailing: Column(
                  children: [
                    SvgPicture.asset(
                   'assets/images/palestine.svg',
                      height: 40.h,
                      width: 40.w,
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          'ILS',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold

                          ),
                          textDirection:TextDirection.ltr ,
                        ))
                  ],
                ),
               leading: Column(
                  children: [
                    SvgPicture.asset(
                      this.flgother,
                      height: 40.h,
                      width: 40.w,
                    ),

                    Expanded(child: Text('1${this.ecchange}',style: TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold

                    ),
                      textDirection:TextDirection.ltr ,


                    ))
                    // Flexible(child: Container(child: Text('1دولار'))),
                  ],
                ),

                title: Container(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sell'),
                          Text(this.numberseel),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Buy'),
                          Text(this.numberbuy),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );


  }
}
