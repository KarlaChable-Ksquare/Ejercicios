import 'package:flutter/material.dart';

import '../services/distance_calculate_service.dart';

class DistanceCalculate extends StatelessWidget {
  const DistanceCalculate({Key? key}) : super(key: key);

  getDistance() async {
    var response = await Countries().getCountries();

    var mexLat = response[144]['latlng'][0];
    var mexLng = response[144]['latlng'][1];

    var greeLat = response[88]['latlng'][0];
    var greeLng = response[88]['latlng'][1];

    var distance = Countries().getDistance(mexLat, mexLng, greeLat, greeLng);
    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distancia entre Paises"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: getDistance(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Distance between'),
                        Text('Mexico and Greenland is...'),
                        Text(
                          '${snapshot.data!}km',
                          style: const TextStyle(color: Colors.green),
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
            ],
          ),
        ),
      ),
    );
  }
}
