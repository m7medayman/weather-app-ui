
import 'package:flutter/cupertino.dart';
import 'package:weather_app/constants/svg_path.dart';
import 'package:weather_app/core/common/widgets/shaper/shaper.dart';

class DarkCloudShape extends StatelessWidget {
  final double height;
  final double width;
  const DarkCloudShape({super.key, required this.height, required this.width});
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
            gradient: LinearGradient(colors: [const Color(0xff5E8398).withOpacity(0.92), Color(0xff5E8398).withOpacity(0.6),const Color(0xff4195C6F)],begin: Alignment.topLeft,end: Alignment.bottomCenter)
          ),
        ),
      )
    );
  }
}
