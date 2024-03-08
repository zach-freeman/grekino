import 'package:flutter/material.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/view_models/volume_movie_list_view_model.dart';
import 'package:grekino/views/movie_list_item.dart';
import 'package:provider/provider.dart';


class VolumeMovieList extends StatefulWidget {
  final int volume;

  const VolumeMovieList({super.key, required this.volume});

  @override
  State<VolumeMovieList> createState() => _VolumeMovieListState();
}

class _VolumeMovieListState extends State<VolumeMovieList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<VolumeMovieListViewModel>().getGreatMovies(widget.volume);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final volumeMovieListViewModel = context.watch<VolumeMovieListViewModel>();
    var title = 'Volume ${widget.volume}';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: _getBody(context, volumeMovieListViewModel, title, widget.volume),
      ),
    );
  }

  Widget _getBody(
      BuildContext context,
      VolumeMovieListViewModel volumeMovieListViewModel,
      String title,
      int volume) {
    if (volumeMovieListViewModel.loading) {
      return const Center(
          child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(),
      ));
    }
    return StreamBuilder<List<GreatMovieModel>>(
      stream: volumeMovieListViewModel.streamGreatMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              key: PageStorageKey<String>('page${volume.toString()}'),
              itemCount: snapshot.data?.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                GreatMovieModel greatMovie = snapshot.data![index];
                return ListTile(
                  title: Text(greatMovie.name ?? 'Unknown'),
                  trailing: const Icon(Icons.visibility),
                  iconColor: greatMovie.isWatched ?? false ? Colors.blue : Colors.grey,
                  subtitle: Text(greatMovie.director ?? 'Unknown'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieListItem(
                                    pageTitle: title,
                                    greatMovie: greatMovie))).then((value) =>
                    {
                      volumeMovieListViewModel
                          .getGreatMovies(widget.volume)
                          .then((result) {
                        setState(() {});
                      })
                    });
                  },
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
