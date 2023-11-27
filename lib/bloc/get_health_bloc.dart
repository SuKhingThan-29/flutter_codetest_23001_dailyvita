import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../model/health.dart';

class HealthBloc {
  final BehaviorSubject<List<Health>> _subject =
  BehaviorSubject<List<Health>>();

  void updateHealthItems() async {
    List<Health> healthList = await loadJsonData();
    print("HealthList: ${healthList.length}");
    _subject.sink.add(healthList);
  }

  Future<List<Health>> loadJsonData() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/general/Healthconcern.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => Health.fromJson(e)).toList();
    } catch (e) {
      // If an error occurs during loading or decoding, throw an exception
      throw Exception('Failed to load JSON data: $e');
    }
  }
  BehaviorSubject<List<Health>> get subject => _subject;

  void dispose() {
    _subject.close();
  }
}

final healthBloc = HealthBloc();
