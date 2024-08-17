import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/dark_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/raining_cloud.dart';

class Lightning extends StatelessWidget {
  const Lightning({
    super.key,
    this.breathAnimationValue=1,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final breathAnimationValue;

  @override
  Widget build(BuildContext context) {
   Color color1= Color(0xffFFE600);
   Color color2= Color(0xffF09000);
      List<BoxShadow> shadows= [      BoxShadow( color: color1.withOpacity(0.6*breathAnimationValue),
                      spreadRadius: 1.0*breathAnimationValue,
                      blurRadius: 16.0*breathAnimationValue,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.6*breathAnimationValue),
                      spreadRadius: 1.0*breathAnimationValue,
                      blurRadius: 16.0*breathAnimationValue,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: color1.withOpacity(0.2*breathAnimationValue),
                      spreadRadius: 16.0*breathAnimationValue,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.2*breathAnimationValue),
                      spreadRadius: 16.0*breathAnimationValue,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )];
    return SizedBox(
      width: width,
      height: height,
      child:  SvgClipperWithShadow(shadows: shadows, clipperPathString: SvgPath.lightning, child: Container(
        decoration:  BoxDecoration(
          gradient:  LinearGradient(colors:  [color1, color2],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        ),
      ),),
    );
  }
}
class LightningCloud extends StatefulWidget {
  const LightningCloud({super.key, required this.height, required this.width});
final double height;
final double width;
  @override
  State<LightningCloud> createState() => _LightningCloudState();
}

class _LightningCloudState extends State<LightningCloud> with SingleTickerProviderStateMixin {
  final Tween<double> tween=Tween(begin: 0 ,end: 1);
  late AnimationController animationController;
  late Animation breathAnimation;
  @override
  void dispose() {
    // TODO: implement dispose
    
    animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    breathAnimation=tween.animate(CurvedAnimation(parent:animationController, curve: Curves.easeIn));
    breathAnimation.addListener(() {
      setState(() {
        
      });
    });
    animationController.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:Stack(
        clipBehavior: Clip.none,
  alignment: Alignment.center,
        children: [
          Positioned(
            top: widget.height*0.8-(breathAnimation.value*widget.height*0.1),
            child: Lightning(width: widget.width*0.2, height: widget.height*0.6,breathAnimationValue: breathAnimation.value,)),
          RainingCloud(height: widget.height, width: widget.width)
        ],
      ),
    );
  }
}