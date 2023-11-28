import 'dart:convert';

import 'package:brewapps/Model/now_playing_movies_reponse_model.dart';
import 'package:brewapps/Model/top_rated_movies_response_model.dart';
import 'package:http/http.dart' as http;

class MovieApis {
  // request to get Now Playing movies
  static Future<dynamic> getNowPlayingMoviesRequest() async {
    String nowPlayingApiUrl =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    try {
      final response = await http.get(Uri.parse(nowPlayingApiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return NowPlayingMoviesReponseModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  // request to get Top Rated Movies
  static Future<dynamic> getTopRatedRequest() async {
    String topRatedMoviesApiUrl =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
    try {
      final response = await http.get(Uri.parse(topRatedMoviesApiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return TopRatedMoviesResponseModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
