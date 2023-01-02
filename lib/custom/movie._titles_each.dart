import 'package:flutter/material.dart';

class MovieEach extends StatelessWidget {
  dynamic data;
  MovieEach({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.blueAccent.shade700,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(data['id'].toString()),
                Text(data['language'].toString()),
                Text(data['genres'].toString()),
                //Text(data['imageMedium']),
                Image.network(data['imageMedium'])
              ],
            )),
      ),
    );
  }
}
