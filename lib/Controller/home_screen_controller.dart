import 'package:brewapps/Model/now_playing_movies_reponse_model.dart';
import 'package:brewapps/Model/results_model.dart';
import 'package:brewapps/Model/top_rated_movies_response_model.dart';
import 'package:brewapps/Requests/apis.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreenController extends GetxController {
  // keep track which screen is currently showing now playing or top rated
  var selectedScreenIndex = 0.obs;

  // keep track of to show the search screen or not
  var showSearchScreen = false.obs;

  // models thats stores the data which we get from api
  Rx<NowPlayingMoviesReponseModel?> nowPlayingMovies =
      NowPlayingMoviesReponseModel().obs;
  Rx<TopRatedMoviesResponseModel?> topRatedMovies =
      TopRatedMoviesResponseModel().obs;

  // stores the movies which we have searched
  var filteredMovies = [].obs;

  // calls when object is created just like init state function in statefull widget
  @override
  void onInit() {
    super.onInit();
    fetchMoviesData();
  }

  // function which filters movie starts from given string
  filterMovies(List<Results> list_of_movies, String movieName) async {
    filteredMovies(list_of_movies
        .where((movie) => movie.originalTitle!
            .toLowerCase()
            .startsWith(movieName.toLowerCase()))
        .toList());
    showSearchScreen(true);
  }

  // fetch the data
  Future<void> fetchMoviesData() async {
    nowPlayingMovies(await MovieApis.getNowPlayingMoviesRequest());
    topRatedMovies(await MovieApis.getTopRatedRequest());
  }
}
