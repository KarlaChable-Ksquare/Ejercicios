import 'package:flutter/material.dart';
import '../services/cleaning_service.dart';

class CleaningList extends StatelessWidget {
  const CleaningList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: FutureBuilder(
          future: CleaningService().getCleaning(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.age.toString());
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
