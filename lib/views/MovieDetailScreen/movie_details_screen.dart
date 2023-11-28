import 'package:brewapps/Model/results_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key, this.MovieInfo});

  Results? MovieInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/original/${MovieInfo!.posterPath}"),
                fit: BoxFit.cover)),
        child:
            // Info Card
            Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MovieInfo!.originalTitle!),
            Text(MovieInfo!.releaseDate!),
          ],
        ),
      ),
    );
  }
}
