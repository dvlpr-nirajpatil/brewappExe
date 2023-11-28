import 'package:brewapps/Model/now_playing_movies_reponse_model.dart';
import 'package:brewapps/Model/results_model.dart';
import 'package:brewapps/Model/top_rated_movies_response_model.dart';
import 'package:brewapps/Requests/apis.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreenController extends GetxController {
  var selectedScreenIndex = 0.obs;

  var showSearchScreen = false.obs;

  Rx<NowPlayingMoviesReponseModel?> nowPlayingMovies =
      NowPlayingMoviesReponseModel().obs;
  Rx<TopRatedMoviesResponseModel?> topRatedMovies =
      TopRatedMoviesResponseModel().obs;

  var filteredMovies = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMoviesData();
  }

  filterMovies(List<Results> list_of_movies, String movieName) async {
    filteredMovies(list_of_movies
        .where((movie) => movie.originalTitle!
            .toLowerCase()
            .startsWith(movieName.toLowerCase()))
        .toList());
    showSearchScreen(true);
  }

  Future<void> fetchMoviesData() async {
    nowPlayingMovies(await MovieApis.getNowPlayingMoviesRequest());
    topRatedMovies(await MovieApis.getTopRatedRequest());
  }
}
