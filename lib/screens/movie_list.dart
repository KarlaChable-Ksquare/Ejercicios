import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/movie_model.dart';
import '../provider/movie_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieProvider>(context, listen: false).getAllMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MazeTv'),
      ),
      body: Consumer<MovieProvider>(builder: ((context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<MovieModel> movies = value.movies;
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: movies.length,
                  itemBuilder: ((BuildContext context, int index) {
                    final MovieModel movie = movies[index];
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            movie.name.toString(),
                            style: const TextStyle(color: Colors.pink),
                          ),
                          Text(movie.language.toString()),
                          Center(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: '${movie.image!.medium}',
                              fit: BoxFit.cover,
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ]);
                  })),
            )
          ],
        );
        // return ListView.builder(
        //   itemCount: movies.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final MovieModel movie = movies[index];
        //     return Container(
        //       padding: const EdgeInsets.all(12.0),
        //       child: ListTile(
        //         title: Text(movie.name.toString()),
        //         subtitle: Text(movie.language.toString()),
        //       ),
        //     );
        //   },
        // );
      })),
    );
  }
}
