import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/models/now_playing_model.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/search_movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;


class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }

  Future<NowPlayingModel> getNowPlayingMovies() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return NowPlayingModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load now playing movies");
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load top rated tvseries");
  }

  Future<SearchMovieModel> getSearchMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc"
    });
    if(response.statusCode == 200){
      log("Success");

      return SearchMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load search movie");
  }

  Future<PopularMovieModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return PopularMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load popular movie");
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    endPoint = 'movie/$id';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movie detail");
  }

  Future<MovieRecommendationModel> getMovieRecommendations(int id) async {
    endPoint = 'movie/$id/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      log("Success");

      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movie recommendation");
  }
}