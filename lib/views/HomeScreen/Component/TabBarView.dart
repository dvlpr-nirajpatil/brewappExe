import 'package:brewapps/Controller/home_screen_controller.dart';
import 'package:brewapps/views/MovieDetailScreen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget tabBarView(controller) {
  return TabBarView(children: [
    NowPlayingMoviesScreen(controller),
    topRatedMoviesScreen(controller),
  ]);
}

NowPlayingMoviesScreen(HomeScreenController controller) {
  return Obx(
    () => Container(
      child: controller.nowPlayingMovies == null ||
              controller.nowPlayingMovies.value!.results == null
          ? Center(
              child: Text("No Movies Available"),
            )
          : ListView.separated(
              itemCount: controller.nowPlayingMovies.value!.results!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => MovieDetailScreen(
                        MovieInfo:
                            controller.nowPlayingMovies.value!.results![index],
                      ),
                    );
                  },
                  leading: Image.network(
                    ('https://image.tmdb.org/t/p/original/${controller.nowPlayingMovies.value!.results![index].backdropPath}'),
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    controller.nowPlayingMovies!.value!.results![index]
                        .originalTitle!,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    controller
                        .nowPlayingMovies!.value!.results![index].overview!,
                    maxLines: 3,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
    ),
  );
}

topRatedMoviesScreen(HomeScreenController controller) {
  return Obx(
    () => Container(
      child: controller.topRatedMovies == null ||
              controller.topRatedMovies.value!.results == null
          ? Center(
              child: Text("No Movies Available"),
            )
          : ListView.separated(
              itemCount: controller.topRatedMovies.value!.results!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => MovieDetailScreen(
                        MovieInfo:
                            controller.topRatedMovies.value!.results![index] ??
                                null,
                      ),
                    );
                  },
                  leading: Image.network(
                    ('https://image.tmdb.org/t/p/original/${controller.topRatedMovies.value!.results![index].backdropPath}'),
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    controller
                        .topRatedMovies!.value!.results![index].originalTitle!,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    controller.topRatedMovies!.value!.results![index].overview!,
                    maxLines: 3,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
    ),
  );
}

searchResultScreen(HomeScreenController controller) {
  return Obx(
    () => Container(
      child: controller.filteredMovies ==
              null // if filterdmovies array is empty then show message
          ? Center(
              child: Text("No Movies Available"),
            )
          : ListView.separated(
              //  showing movies which we have filterd
              itemCount: controller.filteredMovies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => MovieDetailScreen(
                        MovieInfo: controller.filteredMovies[index],
                      ),
                    );
                  },
                  leading: Image.network(
                    ('https://image.tmdb.org/t/p/original/${controller.filteredMovies[index].backdropPath}'),
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    controller.filteredMovies[index].originalTitle!,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    controller.filteredMovies[index].overview!,
                    maxLines: 3,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
    ),
  );
}
