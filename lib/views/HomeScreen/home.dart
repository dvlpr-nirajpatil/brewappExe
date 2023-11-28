import 'package:brewapps/Controller/home_screen_controller.dart';
import 'package:brewapps/views/HomeScreen/Component/TabBar.dart';
import 'package:brewapps/views/HomeScreen/Component/TabBarView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class Home extends StatelessWidget {
  // controller for search bar
  var searchFieldController = TextEditingController();
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    // initializing controller when build method calls
    var controller = Get.put(HomeScreenController());

    return DefaultTabController(
      // controller for the tabbar widget
      length: 2, // 2 beacuse we have only two tabs
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            // its like consumer of proivder
            () => Row(
              children: [
                Expanded(
                  child: TextField(
                    onEditingComplete: () {
                      // when user typing is finished called automaticaly
                      controller.filterMovies(
                          controller.selectedScreenIndex.value ==
                                  0 // if now playing screen is selected then pass nowplaying movies list for search else pass the list of top rated movie
                              ? controller.nowPlayingMovies.value!.results!
                              : controller.topRatedMovies.value!.results!,
                          searchFieldController.text);
                    },
                    controller: searchFieldController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Search"),
                  ),
                ),
                controller.showSearchScreen
                        .value // if show screen varibale is true then show the close option else show search bar
                    ? GestureDetector(
                        onTap: () {
                          controller.showSearchScreen(false);
                        },
                        child: const Icon(Icons.close))
                    : GestureDetector(
                        onTap: () {
                          controller.filterMovies(
                              controller.selectedScreenIndex == 0
                                  ? controller.nowPlayingMovies.value!.results!
                                  : controller.topRatedMovies.value!.results!,
                              searchFieldController.text);
                        },
                        child: const Icon(Icons.search))
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Obx(
              // like consumer
              () => Expanded(
                child: controller.showSearchScreen
                        .value // if show search screen is true the  show search screen else show tab view
                    ? searchResultScreen(controller)
                    : tabBarView(controller),
              ),
            ),
            tabbar(controller) // tab bar
          ],
        ),
      ),
    );
  }
}
