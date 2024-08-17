import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';

class SunCore extends StatelessWidget {
   const SunCore({
    super.key,
    required this.breathAnimationValue, required this.size
  });
  final double breathAnimationValue;
   final Color color1= const Color(0xfFF09000);
   final Color color2= const Color(0xffFFE600);
   final double size;
  @override
  Widget build(BuildContext context) {
      List <BoxShadow> shadows=[
  BoxShadow(
                      color: color1.withOpacity(0.6*breathAnimationValue),
                      spreadRadius: 1*breathAnimationValue,
                      blurRadius: 16*breathAnimationValue,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.6*breathAnimationValue),
                      spreadRadius: 1*breathAnimationValue,
                      blurRadius: 16*breathAnimationValue,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: color1.withOpacity(0.2*breathAnimationValue),
                      spreadRadius: 16*breathAnimationValue,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.2*breathAnimationValue),
                      spreadRadius: 16*breathAnimationValue,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )
  ];
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: shadows,
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [color1,color2],begin: Alignment.bottomLeft,end: Alignment.topRight)
      ),
    );
  }

}


class SunRay extends StatelessWidget {
  final double horizontalOffset;
   const SunRay({
    super.key,
    required this.horizontalOffset,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgClipperWithShadow(shadows: const [], clipperPathString: SvgPath.sunRay, child:Container(
            height: 0.17*size,
            width: 0.07*size,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xfFF09000),Color(0xffFFE600)],begin: Alignment.bottomLeft,end: Alignment.topRight)
            ),
          )),
          SizedBox(
            height: size + horizontalOffset// = total height ,
            
            // child: sunCore()
            ),
        ],
      ),
    );
  }
}

class SunShape extends StatelessWidget {
  const SunShape({
    super.key,
    this.startAnimationValue=1,
    this.breathAnimationValue=0, required this.size,
  });

  final double startAnimationValue;
  final double breathAnimationValue;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
         
          child: Stack(
            children: [        for(int i=0;i<=12;i++)Transform.rotate(
          angle: (2*math.pi*(i/12))*(startAnimationValue*(12/i)<1?startAnimationValue*(12/i):1),
          child: SunRay(horizontalOffset: 0.1*size*breathAnimationValue,size: 0.7*size,)),],
          ),
        ),

    
        IgnorePointer(
          ignoring: true,
          
          child: SunCore(breathAnimationValue: breathAnimationValue,size: 0.45* size,))
      ],
    );
  }
}

