import 'package:brewapps/Controller/home_screen_controller.dart';
import 'package:brewapps/views/HomeScreen/Component/TabBar.dart';
import 'package:brewapps/views/HomeScreen/Component/TabBarView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class Home extends StatelessWidget {
  var searchFieldController = TextEditingController();
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Row(
              children: [
                Expanded(
                  child: TextField(
                    onEditingComplete: () {
                      controller.filterMovies(
                          controller.selectedScreenIndex == 0
                              ? controller.nowPlayingMovies.value!.results!
                              : controller.topRatedMovies.value!.results!,
                          searchFieldController.text);
                    },
                    controller: searchFieldController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search"),
                  ),
                ),
                controller.showSearchScreen.value
                    ? GestureDetector(
                        onTap: () {
                          controller.showSearchScreen(false);
                        },
                        child: Icon(Icons.close))
                    : GestureDetector(
                        onTap: () {
                          controller.filterMovies(
                              controller.selectedScreenIndex == 0
                                  ? controller.nowPlayingMovies.value!.results!
                                  : controller.topRatedMovies.value!.results!,
                              searchFieldController.text);
                        },
                        child: Icon(Icons.search))
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: controller.showSearchScreen.value
                    ? searchResultScreen(controller)
                    : tabBarView(controller),
              ),
            ),
            tabbar(controller)
          ],
        ),
      ),
    );
  }
}
