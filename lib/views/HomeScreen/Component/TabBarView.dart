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
  return Container(
    child: controller.nowPlayingMovies!.length <= 1
        ? Center(
            child: Text("No Movies Available"),
          )
        : RefreshIndicator(
            onRefresh: () async {
              controller.fetchMoviesData();
            },
            child: ListView.separated(
              itemCount: controller.nowPlayingMovies!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: () {
                      controller.deleteMovie(index);
                    },
                  ),
                  onTap: () {
                    Get.to(
                      () => MovieDetailScreen(
                        MovieInfo: controller.nowPlayingMovies![index],
                      ),
                    );
                  },
                  leading: Image.network(
                    ('https://image.tmdb.org/t/p/original/${controller.nowPlayingMovies![index].backdropPath}'),
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    controller.nowPlayingMovies![index].originalTitle!,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    controller.nowPlayingMovies![index].overview!,
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
  return Container(
    child: controller.topRatedMovies!.length <= 1
        ? Center(
            child: Text("No Movies Available"),
          )
        : ListView.separated(
            itemCount: controller.topRatedMovies!.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () {
                    controller.deleteMovie(index);
                  },
                ),
                onTap: () {
                  Get.to(
                    () => MovieDetailScreen(
                      MovieInfo: controller.topRatedMovies![index] ?? null,
                    ),
                  );
                },
                leading: Image.network(
                  ('https://image.tmdb.org/t/p/original/${controller.topRatedMovies![index].backdropPath}'),
                  fit: BoxFit.fill,
                ),
                title: Text(
                  controller.topRatedMovies![index].originalTitle!,
                  maxLines: 1,
                ),
                subtitle: Text(
                  controller.topRatedMovies![index].overview!,
                  maxLines: 3,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
  );
}

searchResultScreen(HomeScreenController controller) {
  return Container(
    child: controller.filteredMovies == null ||
            controller.filteredMovies.length ==
                0 // if filterdmovies array is empty then show message
        ? SingleChildScrollView(
            child: Center(
              child: Text("No Movies Available"),
            ),
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
  );
}
