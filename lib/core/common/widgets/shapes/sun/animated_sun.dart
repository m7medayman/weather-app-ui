
import 'dart:math' as math;
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/common/widgets/shapes/sun/sun_shape.dart';


class AnimatedSun extends StatefulWidget {
  const AnimatedSun({super.key, required this.size});
  final double size;
  @override
  State<AnimatedSun> createState() => _AnimatedSunState();
}

class _AnimatedSunState extends State<AnimatedSun> with TickerProviderStateMixin {
  late AnimationController startAnimation;
  late AnimationController interpolateAnimation;
  late Animation breathAnimation;
  late AnimationController  breathAnimationController;
  final Tween breathAnimationTween=Tween<double>(
    begin: 0,
    end: 1
  );
  @override
  void dispose() {
    // TODO: implement dispose

    
    breathAnimationController.dispose();
    startAnimation.dispose();
    interpolateAnimation.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     breathAnimationController=AnimationController(vsync:this,duration: const Duration(milliseconds: 1000));
    final breathAnimationCurvedController= CurvedAnimation(parent: breathAnimationController, curve: Curves.easeInSine);
     breathAnimation= breathAnimationTween.animate(breathAnimationCurvedController);
    startAnimation=AnimationController(vsync: this,duration:const Duration(
    milliseconds: 1000
  ) );
  interpolateAnimation=AnimationController(vsync: this,duration: const Duration(
    milliseconds: 10000
  ),);
  startAnimation.addListener(() {
    setState(() {
      
    });
  });
  interpolateAnimation.addListener(() {
    setState(() {
      
    });
  });

  startAnimation.forward().whenComplete(() {
     interpolateAnimation.repeat();
     breathAnimationController.repeat(reverse:true );
    
     
     

  });
  
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      child: Transform.rotate(
        angle: math.pi*2*interpolateAnimation.value,
          child: Sun(startAnimation: startAnimation,breathAnimation: breathAnimation,size: widget.size,),
      ),
    );
  }
}

class Sun extends StatelessWidget {
  const Sun({
    super.key,
    required this.startAnimation, required this.breathAnimation, required this.size,
  });
  final double size;
  final AnimationController startAnimation;
  final Animation breathAnimation;
  @override
  Widget build(BuildContext context) {
    return SunShape(startAnimationValue: startAnimation.value, breathAnimationValue: breathAnimation.value,size: size,);
  }
}


