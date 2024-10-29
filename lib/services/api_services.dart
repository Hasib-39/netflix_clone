import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/now_playing_model.dart';
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
}