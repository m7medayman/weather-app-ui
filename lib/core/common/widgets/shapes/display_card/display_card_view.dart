import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/light_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/rect/rect1.dart';
import 'package:weather_app/core/common/widgets/shapes/sun/animated_sun.dart';

class DisplayCard extends StatelessWidget { 
  const DisplayCard({super.key, required this.width, required this.height,  this.headText="", this.degreeText="", required this.weatherWidget, this.topAlign, this.leftAlign,required this.k});
  final double width;
  final double height;
  final String headText;
  final String degreeText;
  final Widget weatherWidget;
  final double? topAlign;
  final double? leftAlign;
  final Key k;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      key:k ,
      child: RectShape(
        topAlign: topAlign,
        leftAlign: leftAlign,
        height: height,
        width: width,
        outerWidget: weatherWidget,
        innerWidget: Column(
          children: [
             Container(
              child:
               Text("$headText",style: TextStyle(fontSize: 25 ,color:Colors.white),)
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child:
               Text("$degreeText°",style: TextStyle(fontSize: 130 ,color:Colors.white,fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );
  }
}