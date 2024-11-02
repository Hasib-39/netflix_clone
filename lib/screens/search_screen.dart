import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/search_movie_model.dart';
import 'package:netflix_clone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<PopularMovieModel> popularMovieModel;
  ApiServices apiServices = ApiServices();

  SearchMovieModel? searchMovieModel;

  @override
  void initState() {
    // TODO: implement initState
    popularMovieModel = apiServices.getPopularMovies();
    super.initState();
  }
  void search(String query){
    apiServices.getSearchMovie(query).then((results){
      setState(() {
        searchMovieModel=results;
      });
    });
  }
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  controller: searchController,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value){
                    if(value.isEmpty){
                    }else{
                      search(searchController.text);
                    }
                  },
                ),
                searchController.text.isEmpty
                    ? FutureBuilder(future: popularMovieModel, builder: (context, snapshot){
                  if(snapshot.hasData) {
                    var data = snapshot.data?.results;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Text(
                          "Top Searches",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ListView.builder(
                            itemCount: data!.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 150,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                        '$imageUrl${data[index].posterPath}'
                                    ),
                                    const SizedBox(width:  20,),
                                    SizedBox(
                                      width: 260,
                                      child: Text(
                                        data[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                      ],
                    );
                  }else{
                    return const SizedBox.shrink();
                  }
                })
                :searchMovieModel==null?
                    const SizedBox.shrink()
                    :GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: searchMovieModel?.results.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.2 / 2,
                    ),
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          searchMovieModel!.results[index].backdropPath == null
                          ?Image.asset('assets/netflix.png', height: 170,)
                          :CachedNetworkImage(
                              imageUrl: "$imageUrl${searchMovieModel!.results[index].backdropPath}",
                            height: 170,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              searchMovieModel!.results[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
