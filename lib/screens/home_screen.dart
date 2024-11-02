import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/now_playing_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_movie_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/custom_carousel.dart';
import 'package:netflix_clone/widgets/movie_card_widget.dart';
import 'package:netflix_clone/widgets/now_playing_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<NowPlayingModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeries;


  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    upcomingFuture=apiServices.getUpcomingMovies();
    nowPlayingFuture=apiServices.getNowPlayingMovies();
    topRatedSeries=apiServices.getTopRatedSeries();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
            "assets/logo.png",
          height: 50,
          width: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const SearchScreen()));
              },
                child: const Icon(
                  size: 30,
                    Icons.search,
                  color: Colors.white,
                ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              color: Colors.blue,
              height: 27,
              width: 27,
            ),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(future: topRatedSeries, builder: (context, snapshot){
                if(snapshot.hasData){
                  return CustomCarouselSlider(data: snapshot.data!);
                }else{
                  return const SizedBox.shrink();
                }
              }),
              SizedBox(
                  height: 220,
                  child: NowPlayingCard(future: nowPlayingFuture, headLineText: "Now Playing")
              ),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 220,
                  child: MovieCardWidget(future: upcomingFuture, headLineText: "Upcoming Movies")
              ),
            ],
          ),
        ),
      )
    );
  }
}
