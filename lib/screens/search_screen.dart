import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/search_movie_model.dart';
import 'package:netflix_clone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();

  SearchMovieModel? searchMovieModel;

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
              searchMovieModel==null?
                  const SizedBox.shrink()
                  :GridView.builder(
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
                        CachedNetworkImage(
                            imageUrl: "$imageUrl${searchMovieModel!.results[index].backdropPath}",
                          height: 170,
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            searchMovieModel!.results[index].originalName,
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
    );
  }
}
