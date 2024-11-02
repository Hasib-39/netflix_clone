

import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/services/api_services.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailScreen({super.key,required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetailModel> movieDetail;
  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData(){
    movieDetail=apiServices.getMovieDetail(widget.movieId);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final movie = snapshot.data;
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('$imageUrl${movie!.backdropPath}')
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }else{
              return const SizedBox();
            }
          }
        ),
      ),
    );
  }
}
