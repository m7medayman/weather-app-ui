import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/utilities/random_generators.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/dark_cloud.dart';
import 'dart:math';

class RainingCloud extends StatefulWidget {
   RainingCloud({super.key,
  this.rainCount=5, required this.height, required this.width});
  final int rainCount;
  final double height;
  final double width ;
  @override
  State<RainingCloud> createState() => _RainingCloudState();
}

class _RainingCloudState extends State<RainingCloud> with TickerProviderStateMixin{
late List<AnimationController> dropAnimationController;
late List<Tween<double>> dropAnimationTween;
 late List<bool> triggered;
 List<Animation> dropAnimation=[];

 @override
  void dispose() {
    // TODO: implement dispose
   
    dropAnimationController.forEach((element) {
      element.dispose();
    });
     super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropAnimationTween=List.generate(widget.rainCount, (index) => Tween(begin: 0,end: 1));
    dropAnimationController=List.generate(widget.rainCount, (index) =>  AnimationController(vsync: this,duration:  Duration(milliseconds:RandomGenerator.getRand(300, 400))));
    dropAnimationTween.forEach((tween) {
      Animation animation= tween.animate(dropAnimationController[dropAnimationTween.indexOf(tween)]);
      dropAnimation.add(animation);
    });
      triggered = List.filled(widget.rainCount, false); // Initialize the triggered list
    for(int i=0;i<dropAnimationController.length;i++){
      var controller=dropAnimationController[i];
      controller.addListener(() { 
        setState(() { });
        
        int nextController = i + 1;
        if(nextController>=dropAnimationController.length){
          nextController=0;
        }
        if(controller.value>controller.upperBound/RandomGenerator.getRand(2, 6) && !triggered[nextController]&&triggered[i]){
          dropAnimationController[nextController].forward();
          triggered[nextController]=true;
        }
      });
      controller.addStatusListener((status) {
        
          if (status == AnimationStatus.completed) {
          controller.reset();
          triggered[i]=false;

        }
      });
    }
     dropAnimationController[0].forward();
     triggered[0]=true;
    
  }  
  @override
  Widget build(BuildContext context) {

    return  Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for(var animation in dropAnimation)    Positioned(
            top: (animation.value*widget.height*0.5)+(widget.height*0.8),
            right: ((animation.value*0.25)*40 )+widget.width*0.85-(widget.width*0.85/widget.rainCount)*dropAnimation.indexOf(animation),
            child: Opacity(
              opacity:1.0-animation.value,
              child: RainDrop(width: 10, height: 40))),
          DarkCloudShape(height: widget.height, width: widget.width)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [...(rainDrops.map((rainDrop) =>Positioned(
          //     top:dropAnimation[rainDrops.indexOf(rainDrop)].value ,
          //     right:dropAnimation[rainDrops.indexOf(rainDrop)].value ,
          //     child: rainDrop,)).toList())],
          // )
          ],
      ),
    );
  }
}

class RainDrop extends StatelessWidget {
const RainDrop({super.key, required this.width, required this.height});

final double width;
final double height;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.14*0.09,
      child: SizedBox(
        width: width,
        height: height,
        child: SvgClipperWithShadow(shadows: [], clipperPathString: SvgPath.rainDrop, child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff92BDFF),Color(0xff3981EE)],
            begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
        ),),
      ),
    );
  }
}