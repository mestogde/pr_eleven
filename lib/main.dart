import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import '/screens/details_screen.dart';
import '/screens/image_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Привычки',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: HomeScreen(),
      routes: {
        '/details': (context) => DetailsScreen(habitTitle: ''),
        '/image': (context) => ImageScreen(imageUrl: ''),
      },
    );
  }
}
