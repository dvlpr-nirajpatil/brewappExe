import 'package:brewapps/views/HomeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MoviesFlix());
}

class MoviesFlix extends StatelessWidget {
  const MoviesFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
