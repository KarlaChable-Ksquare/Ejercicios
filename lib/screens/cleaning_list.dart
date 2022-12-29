import 'package:flutter/material.dart';
import 'package:mazetv/services/cleaning2_service.dart';
import '../services/cleaning_service.dart';

class CleaningList extends StatelessWidget {
  CleaningList({Key? key}) : super(key: key);

  mainFunction() async {
    String url = 'https://coderbyte.com/api/challenges/json/json-cleaning';
    var response = await Cleaning2().getInformation(url);
    var clean = Cleaning2().cleanJson(response);
    return clean;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: FutureBuilder(
          future: mainFunction(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Clean data is:'),
                  Text(
                    snapshot.data!.toString(),
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              print('error');
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
