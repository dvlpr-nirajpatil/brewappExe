import 'package:brewapps/Controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

Widget tabbar(HomeScreenController controller) {
  return Container(
    height: 80,
    child: TabBar(
        onTap: (value) {
          controller.selectedScreenIndex(value);
        },
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.only(top: 10.0),
        tabs: [
          Tab(
            text: "Now Playing",
            icon: Icon(Icons.movie),
          ),
          Tab(
            text: "TopRated",
            icon: Icon(Icons.grade),
          ),
        ]),
  );
}
