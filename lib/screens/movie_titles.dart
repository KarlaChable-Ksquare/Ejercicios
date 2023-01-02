import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../services/moviesTitle_service.dart';

class MovieTitles extends StatelessWidget {
  const MovieTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies List'),
          backgroundColor: Colors.blueAccent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.movie_creation),
              tooltip: 'Open Details',
              onPressed: () {
                Navigator.pushNamed(context, '/movieEach');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: MovieTitlesService().fetchMovies(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> movies = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final MovieModel movie = movies[index];
                        return GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(context, '/movieEach',
                                arguments: {
                                  'id': movie.id,
                                  'url': movie.url,
                                  'name': movie.name,
                                  'language': movie.language,
                                  'genres': movie.genres,
                                  'imageMedium': movie.image!.medium.toString(),
                                  'sumary': movie.summary
                                });
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              title: Text(movie.name.toString()),
                              subtitle: Text(movie.genres.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Text('Error, no data');
                }
                return const Center(
                    heightFactor: 20,
                    widthFactor: 20,
                    child: CircularProgressIndicator());
              },
            ),
          ],
        ));
  }
}
