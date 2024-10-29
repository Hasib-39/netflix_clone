import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          SizedBox(width: 20,)
        ],
      ),
      body: const Center(
        child: Text('Hi it is Home Screen'),
      ),
    );
  }
}
