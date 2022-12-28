import 'package:flutter/material.dart';

import '../model/distance_model.dart';
import '../services/distance_service.dart';

class DistanceProvider extends ChangeNotifier {
  final _service = DistanceService();
  bool isLoading = false;

  List<DistanceModel> _countries = [];
  List<DistanceModel> get countries => _countries;

  Future<void> getAllCountries() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _countries = response;
    isLoading = false;
    notifyListeners();
  }
}
