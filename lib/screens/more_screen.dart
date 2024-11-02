import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
                title: const Text(
                    "New & Hot",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                actions:  [
                  const Icon(Icons.cast, color: Colors.white,),
                  const SizedBox(width: 20,),
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
                bottom:  TabBar(
                  dividerColor: Colors.black,
                    isScrollable: false,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                    unselectedLabelColor: Colors.white,
                    tabs: const [
                    Tab(
                      text: "    🍿 Coming Soon     ",
                    ),
                    Tab(
                      text: "    🔥 Everyone's Watching     ",
                    )
                  ]
                ),
              ),
            )
        )
    );
  }
}

