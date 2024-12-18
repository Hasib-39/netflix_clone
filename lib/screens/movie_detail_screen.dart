

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
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
  late Future<MovieRecommendationModel> movieRecommendation;
  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData(){
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendation = apiServices.getMovieRecommendations(widget.movieId);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print("movie id: ${widget.movieId}");
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final movie = snapshot.data;
              String genresText = movie!.genres.map((genre) => genre.name).join(', ');
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "$imageUrl${movie.backdropPath}"),
                            fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                                onPressed: (){
                                    Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          children: [
                            Text(movie.releaseDate.year.toString(),
                              style: const TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Text(genresText,
                              style: const TextStyle(
                                  color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Text(movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  FutureBuilder(future: movieRecommendation, builder: (context, snapshot){
                    if(snapshot.hasData){
                      final movieRecommendations = snapshot.data;

                      return movieRecommendations!.results.isEmpty
                          ?const SizedBox.shrink()
                          :Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const Text("More Like This"),
                            const SizedBox(height: 20,),
                            GridView.builder(
                              itemCount: movieRecommendations.results.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 5,
                                childAspectRatio: 1.5 / 2),
                              itemBuilder: (context, index){
                               return InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                       MovieDetailScreen(movieId: movieRecommendations.results[index].id),
                                   ));
                                 },
                                   child: CachedNetworkImage(imageUrl: "$imageUrl${movieRecommendations.results[index].posterPath}",));
                              },
                            ),
                                                    ],
                                                  ),
                          );
                    }else{
                      return const Text("Something Went Wrong");
                    }
                  })
                ],
              );
            }else{
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/netflix.png'
                                ),
                                fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
          }
        ),
      ),
    );
  }
}
