import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/now_playing_model.dart';

class NowPlayingCard extends StatelessWidget {
  final Future<NowPlayingModel> future;
  final String headLineText;
  const NowPlayingCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context, snapshot){
      if(snapshot.hasData) {
        var data = snapshot.data?.results;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headLineText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  itemCount: data!.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                          '$imageUrl${data[index].posterPath}'),
                    );
                  }),
            )
          ],
        );
      }else{
        return const SizedBox.shrink();
      }
    });
  }
}
