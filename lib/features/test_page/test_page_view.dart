import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/assets.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/light_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/lightning_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/cloud/raining_cloud.dart';
import 'package:weather_app/core/common/widgets/shapes/display_card/display_card_controller.dart';
import 'package:weather_app/core/common/widgets/shapes/display_card/display_card_view.dart';
import 'package:weather_app/core/common/widgets/shapes/display_card/mini_display_card.dart';
import 'package:weather_app/core/common/widgets/shapes/rect/rect1.dart';
import 'package:weather_app/core/common/widgets/shapes/rect/rect2.dart';
import 'package:weather_app/core/common/widgets/shapes/sun/animated_sun.dart';
import 'package:weather_app/core/common/widgets/shapes/sun/sun_shape.dart';



class TestPageView extends StatefulWidget {
  const TestPageView({super.key});

  @override
  State<TestPageView> createState() => _TestPageViewState();
}

class _TestPageViewState extends State<TestPageView>  {

   static const double widgetHeight=300;
   static const double widgetWidth=370;
   static const double minWidgetWidth=50;
   static const double miniWidgetHeight=100;
  WeatherWidgetData data=WeatherWidgetData(type: WeatherWidgetEnum.stormy, dayText: 'st',
   miniHeight:miniWidgetHeight, miniWidth: minWidgetWidth, isActivate: true, width: widgetWidth, height: widgetHeight, 
   headText: "cairo egypt", degreeText: '25', location: "cairo egypt");

List<WeatherWidgetData> weatherDataList = [
  WeatherWidgetData(
    type: WeatherWidgetEnum.sunny,
    dayText: 'Sun',
    miniHeight: miniWidgetHeight,
    miniWidth: minWidgetWidth,
    isActivate: true,
    width: widgetWidth,
    height: widgetHeight,
    headText: "New York, USA",
    degreeText: '30',
    location: "New York, USA",
  ),
  WeatherWidgetData(
    type: WeatherWidgetEnum.rainy,
    dayText: 'Mon',
    miniHeight: miniWidgetHeight,
    miniWidth: minWidgetWidth,
    isActivate: false,
    width: widgetWidth,
    height: widgetHeight,
    headText: "London, UK",
    degreeText: '15',
    location: "London, UK",
  ),
  WeatherWidgetData(
    type: WeatherWidgetEnum.cloudy,
    dayText: 'Tue',
    miniHeight: miniWidgetHeight,
    miniWidth: minWidgetWidth,
    isActivate: false,
    width: widgetWidth,
    height: widgetHeight,
    headText: "Paris, France",
    degreeText: '20',
    location: "Paris, France",
  ),
  WeatherWidgetData(
    type: WeatherWidgetEnum.cloudyWeather,
    dayText: 'Wed',
    miniHeight: miniWidgetHeight,
    miniWidth: minWidgetWidth,
    isActivate: false,
    width: widgetWidth,
    height: widgetHeight,
    headText: "Berlin, Germany",
    degreeText: '18',
    location: "Berlin, Germany",
  ),
  WeatherWidgetData(
    type: WeatherWidgetEnum.stormy,
    dayText: 'Thu',
    miniHeight: miniWidgetHeight,
    miniWidth: minWidgetWidth,
    isActivate: false,
    width: widgetWidth,
    height: widgetHeight,
    headText: "Cairo, Egypt",
    degreeText: '25',
    location: "Cairo, Egypt",
  ),
];

  @override
  Widget build(BuildContext context){
 Key k= UniqueKey();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.white,size: 30,),
        actions: [Icon(Icons.settings,color: Colors.white,size: 30)],
        elevation: 0,
        backgroundColor: Color(0xff2E2E2E),
      ),
body: Center(
  child: Container(
    height: double.maxFinite,
    width: double.maxFinite,
    color:Color(0xff2E2E2E),
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        WeatherWidgetFactory((weatherDataList.firstWhere((element) => element.isActivate))).getCardWidget(k),
        SizedBox(
          height: 160,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
            
              padding: const EdgeInsets.all(10.0),
              child: Text("Next Day >",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffA7CAFF)
              ),),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: weatherDataList.map((e) =>InkWell(onTap: 
          (){
            setState(() {
            weatherDataList.forEach((element) {element.isActivate=false;});
           e.isActivate=true;
            });
          },
            child: WeatherWidgetFactory(e).getMiniCardWidget())).toList(),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                   color: Colors.white     
                ),
              ),
            ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                           color: Color(0xffC5C5C5)     
                                        ),
                                      ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                           color: Color(0xffC5C5C5)    
                                        ),
                                      ),
                        )
          ],
        )
      ],
    )),
  ));
  }}

enum WeatherType{
rainy,
cloudy,
cloudyWeather,
stormy,
sunny
}
