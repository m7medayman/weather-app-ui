

import 'package:flutter/material.dart';
import 'package:weather_app/core/theme_manager/theme_manager.dart';
import 'package:weather_app/features/test_page/test_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getTheme(context),
      debugShowCheckedModeBanner: false,
      home: TestPageView()
    );
  }
}
