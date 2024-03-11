

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grekino/views/volume_movie_list.dart';

import '../delegates/movie_search_delegate.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Directionality(
         textDirection: TextDirection.ltr,
            child: Scaffold(
          appBar: AppBar(
            titleTextStyle:
            const TextStyle(color: Colors.yellowAccent, fontSize: 24),
            bottom: const TabBar(
              indicatorColor: Colors.yellowAccent,
              labelColor: Colors.yellowAccent,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(icon: Icon(Icons.filter_1)),
                Tab(icon: Icon(Icons.filter_2)),
                Tab(icon: Icon(Icons.filter_3)),
                Tab(icon: Icon(Icons.filter_4)),
              ],
            ),
            title: const Text('Grekino'),
            backgroundColor: Colors.blue.shade500,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: MovieSearchDelegate());
                    },
                    icon: const Icon(Icons.search, color: Colors.yellowAccent),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: IconButton(
                    key: const Key('profileButton'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<ProfileScreen>(
                          builder: (context) => ProfileScreen(
                            appBar: AppBar(
                              title: const Text('User Profile'),
                            ),
                            actions: [
                              SignedOutAction((context) {
                                Navigator.of(context).pop();
                              })
                            ],
                            children: [
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset('assets/grekino_192x.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.account_circle_outlined, color: Colors.yellowAccent),
                  )),
            ],
          ),
          body: PageStorage(
              bucket: _bucket,
              child: const TabBarView(children: [
                VolumeMovieList(volume: 1),
                VolumeMovieList(volume: 2),
                VolumeMovieList(volume: 3),
                VolumeMovieList(volume: 4)
              ])),
        )));
  }
}