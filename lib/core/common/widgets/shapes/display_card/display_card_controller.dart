import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/assets.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/light_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/lightning_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/raining_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/display_card/display_card_view.dart';
import 'package:weather_app/core/common/widgets/shapes/display_card/mini_display_card.dart';
import 'package:weather_app/core/common/widgets/shapes/sun/animated_sun.dart';

abstract class WeatherCardAbstract{

final WeatherWidgetData data;

  WeatherCardAbstract({required this.data}); 
   Widget getCardWidget(Key k);
   Widget getMiniCardWidget();
}

class SunnyWeather extends WeatherCardAbstract{
  SunnyWeather({required super.data});
 
  @override
    Widget getMiniCardWidget() {
    return MiniDisplayCard(
    
      topText: data.dayText,
      bottomText: data.degreeText,
      height: data.miniHeight,
      width: data.miniWidth,
      isActivated: data.isActivate,
      svgPath:Assets.assetsIconsSunGroup,
    );
  }

  @override
  Widget getCardWidget(Key k) {
    return DisplayCard(
      k: k,
      headText:data.headText ,degreeText:data.degreeText ,
    width: data.width, height: data.height,weatherWidget: AnimatedSun(size: 
    150));
  }
}
class CloudyWeather extends WeatherCardAbstract{
  CloudyWeather({required super.data});
  @override
    Widget getMiniCardWidget() {
    return MiniDisplayCard(
      topText: data.dayText,
      bottomText: data.degreeText,
      height: data.miniHeight,
      width: data.miniWidth,
      isActivated: data.isActivate,
      svgPath:Assets.assetsIconsCloudyGroup
    );
  }
    Widget getCardWidget(Key k) {
    return  DisplayCard(
      k: k,headText:data.headText ,degreeText:data.degreeText ,
    width: data.width, height: data.height, weatherWidget: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 70,
          top: -10,
          child: AnimatedSun(size: 125,)),
        LightCloudShape(height: 150, width: 170),
      ],
    ),);
  }

}
class RainyWeather extends WeatherCardAbstract {
  RainyWeather({required super.data});
  @override
    Widget getMiniCardWidget() {
    return MiniDisplayCard(
      topText: data.dayText,
      bottomText: data.degreeText,
      height: data.miniHeight,
      width: data.miniWidth,
      isActivated: data.isActivate,
      svgPath: Assets.assetsIconsRainyGroup,
    );
  }
  
  @override
  Widget getCardWidget(Key k) {
    return DisplayCard(
      k: k,headText:data.headText ,degreeText:data.degreeText ,
    width: data.width, height: data.height, weatherWidget:RainingCloud(height: 150, width: 200));
  }
}

class StormyWeather extends WeatherCardAbstract{
  StormyWeather({required super.data});

   @override
    Widget getMiniCardWidget() {
    return MiniDisplayCard(
      topText: data.dayText,
      bottomText: data.degreeText,
      height: data.miniHeight,
      width: data.miniWidth,
      isActivated: data.isActivate,
      svgPath: Assets.assetsIconsStormyGroup,
    );
  }
  @override
  Widget getCardWidget(Key k) {
    return DisplayCard(
      k: k,headText:data.headText ,degreeText:data.degreeText ,
    width: data.width, height: data.height, weatherWidget: LightningCloud(height: 150,width: 200,));
  }
}

enum WeatherWidgetEnum{
rainy,
cloudy,
cloudyWeather,
stormy,
sunny
}
class WeatherWidgetData{
  final String location;
 final double width;
 final double height ;
 final String headText;
 final String degreeText;
 final double? topAlign;
 final double? leftAlign;
 final String dayText;
 final double miniHeight;
 final double miniWidth;
  bool isActivate;
final WeatherWidgetEnum type;
  WeatherWidgetData( {required this.type, required this.dayText, required this.miniHeight, required this.miniWidth,
   required this.isActivate,this.topAlign, this.leftAlign, required this.width,required  this.height, required this.headText,required  this.degreeText, required this.location, });
}

class WeatherWidgetFactory  {
  late WeatherCardAbstract widget; 

   WeatherWidgetFactory(
    WeatherWidgetData data
  ){
  widget=_createWeatherWidget(data);
  }
  WeatherCardAbstract _createWeatherWidget(WeatherWidgetData data) {
    switch (data.type) {
      case WeatherWidgetEnum.cloudy:
        return CloudyWeather(data: data);
      case WeatherWidgetEnum.rainy:
        return RainyWeather(data: data);
      case WeatherWidgetEnum.stormy:
        return StormyWeather(data: data);
      case WeatherWidgetEnum.sunny:
        return SunnyWeather(data: data);
      case WeatherWidgetEnum.cloudyWeather:
        return CloudyWeather(data: data);
      default:
        throw Exception("Unable to get the name of the weather widget");
    }
  }
 
  

  Widget getCardWidget(Key k) {
    return widget.getCardWidget(k);
  }
  
  Widget getMiniCardWidget() {
    return widget.getMiniCardWidget();
  }
}
