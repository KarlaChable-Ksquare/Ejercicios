import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/distance_model.dart';
import '../provider/distance_provider.dart';

class DistanceList extends StatefulWidget {
  const DistanceList({Key? key}) : super(key: key);

  @override
  State<DistanceList> createState() => _DistanceListState();
}

class _DistanceListState extends State<DistanceList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DistanceProvider>(context, listen: false).getAllCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paises"),
        backgroundColor: Colors.green,
      ),
      body: Consumer<DistanceProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DistanceModel> paises = value.countries;
          return ListView.builder(
            itemCount: paises.length,
            itemBuilder: (context, index) {
              final DistanceModel pais = paises[index];
              return Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      pais.name.toString(),
                    ),
                    subtitle: Text(
                        'Latitud: ${pais.latlng![0]}, Latitud: ${pais.latlng![1]}'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text('Este es un child'),
      ),
    );
  }
}
