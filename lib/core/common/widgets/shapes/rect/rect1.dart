import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';

class RectShape extends StatefulWidget {
   RectShape({
    Key? key,
    required this.innerWidget, required this.height, required this.width, required this.outerWidget, this.topAlign, this.leftAlign,
  }) : super(key: key){
    topAlign=topAlign??0.6;
    leftAlign=leftAlign??0.3;
  }
  final Widget innerWidget;
  final Widget outerWidget;
  final double height;
 final double   width;
  double? topAlign;
  double? leftAlign;
  @override
  State<RectShape> createState() => _RectShapeState();
}

class _RectShapeState extends State<RectShape>with TickerProviderStateMixin {
  late AnimationController  startAnimationController;
  late Animation startAnimation;
  bool isAnimationEnd=false;
  final Tween startAnimationTween=Tween<double>(
    begin: 0,
    end: 1
  );
  @override
  void dispose() {
    // TODO: implement dispose
    
    startAnimationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    startAnimationController=AnimationController(vsync: this,duration: const Duration(milliseconds:1000));
    final startCurvedAnimationController=CurvedAnimation(parent: startAnimationController, curve: Curves.bounceOut);
    startAnimation=startAnimationTween.animate(startCurvedAnimationController);
    startAnimation.addListener(() {
      setState(() {
        if(startAnimation.value>=0.1 && isAnimationEnd==false){
          isAnimationEnd=true;
        }
      });
    });
    startAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [Container(
               child: SvgClipperWithShadow(
                         shadows: [],
                         clipperPathString: SvgPath.shape1,
                         child: Container(
                height: (widget.height *startAnimation.value).toDouble(),
                width: (widget.width *startAnimation.value).toDouble(),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff4B50C0),Color(0xffDD94F6)] ,begin:Alignment.topLeft,end: Alignment.bottomRight)
                    
                ),
                child:Container()
                         ),
                       ),
             ),
             isAnimationEnd? Positioned(
           top:  (widget.topAlign!*widget.height).toDouble(),
           left:  (widget.leftAlign!*widget.width).toDouble(),
          child: Transform.scale(
            scale: (1*startAnimation.value).toDouble(),
            child: widget.outerWidget)):Container(),
         isAnimationEnd? 
                InsideWidgets(startAnimation: startAnimation, widget: widget):Container(),
        ],
      ),
    );
  }
}

class InsideWidgets extends StatelessWidget {
  const InsideWidgets({
    super.key,
    required this.startAnimation,
    required this.widget,
  });

  final Animation startAnimation;
  final RectShape widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Transform.scale(
          scale: (1*startAnimation.value).toDouble(),
          child: Container(child: widget.innerWidget)),
      ),
    );
  }
}