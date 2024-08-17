import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/constants/assets.dart';
import 'package:weather_app/core/common/widgets/shapes/rect/rect2.dart';

class MiniDisplayCard extends StatelessWidget {
  const MiniDisplayCard({super.key, required this.height, required this.width,  required this.topText, required this.bottomText, required this.isActivated, required this.svgPath});
  final double height;
  final double width;
  final String topText;
  final String bottomText;
  final bool isActivated;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return MiniCard(isActivated: isActivated, insideWidget: Column(
      children: [
        Text(topText,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Colors.white),),
        SvgPicture.asset(svgPath,width: width*0.5,height: height*0.5,),
        Text("$bottomText °",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:Colors.white),),
      ],
    ), width: width, height: height);
  }
}