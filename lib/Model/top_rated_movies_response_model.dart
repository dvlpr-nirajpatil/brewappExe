import 'results_model.dart';

class TopRatedMoviesResponseModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMoviesResponseModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  TopRatedMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    _data["total_pages"] = totalPages;
    _data["total_results"] = totalResults;
    return _data;
  }
}
