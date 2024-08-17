import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';

class LightCloudShape extends StatelessWidget {
  final double height;
  final double width;
  const LightCloudShape({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
     child:  SvgClipperWithShadow(
        clipperPathString: SvgPath.cloud,
        shadows: const [],
        child: Container(
          height: height,
          width: width,
          decoration:BoxDecoration(
            gradient: LinearGradient(colors: [const Color(0xffFFFFFF),const Color(0xff85C6EC).withOpacity(0.92)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
        ),
      )
    );
  }
}

class AnimatedCloud extends StatefulWidget {
  final double height;
  final double width;

   AnimatedCloud({super.key, required this.height, required this.width});
  @override
  State<AnimatedCloud> createState() => _AnimatedCloudState();
}
class _AnimatedCloudState extends State<AnimatedCloud> with SingleTickerProviderStateMixin {
  final Tween offsetTween=Tween(begin:-10,end:10);
 late AnimationController offsetAnimationController;
 late Animation offsetAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offsetAnimationController=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    offsetAnimation=offsetTween.animate(CurvedAnimation(parent: offsetAnimationController, curve: Curves.ease));
    offsetAnimation.addListener(() {
      setState(() {
      });
    });
    offsetAnimationController.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: offsetAnimation.value,
          left: offsetAnimation.value,
          child: LightCloudShape(height: widget.height,width: widget.width,)),
        Container(height: widget.height+50,width: widget.width+50,)
      ],
    );
    
  }
}
