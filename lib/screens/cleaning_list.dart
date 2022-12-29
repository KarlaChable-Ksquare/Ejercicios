import 'package:flutter/material.dart';
import 'package:mazetv/services/cleaning2_service.dart';
import '../services/cleaning_service.dart';

class CleaningList extends StatelessWidget {
  CleaningList({Key? key}) : super(key: key);

  main1Function() async {
    var response = await CleaningService().getCleaning();
    var clean1 = CleaningService().removeVal(response);
    return clean1;
  }

  main2Function() async {
    String url = 'https://coderbyte.com/api/challenges/json/json-cleaning';
    var response = await Cleaning2().getInformation(url);
    var clean2 = Cleaning2().cleanJson(response);
    return clean2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: main1Function(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Clean data is 1:'),
                      Text(
                        snapshot.data!.toString(),
                        style: TextStyle(color: Colors.purpleAccent),
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
            const SizedBox(
              height: 12.0,
            ),
            FutureBuilder(
              future: main2Function(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Clean data is 2:'),
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
          ],
        ),
      ),
    );
  }
}
