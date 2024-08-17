import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';

class MiniCard extends StatelessWidget {
    MiniCard({super.key, required this.isActivated, required this.insideWidget, required this.width, required this.height});
    bool isActivated;
   final Widget insideWidget;
   final double width ;
   final double height ;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SvgClipperWithShadow(shadows: [], clipperPathString: SvgPath.shape2, child: isActivated? Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff4B4FC0),Color(0xffDD94F6)],begin: Alignment.topLeft,end: Alignment.bottomRight)
            ),
          ):Container(
            height: height,
            width: width,
            color: Color.fromRGBO(255, 255, 255, 0.15),
          )),
          Container(
            child: insideWidget),
        ],
      ),
    );
  }
}