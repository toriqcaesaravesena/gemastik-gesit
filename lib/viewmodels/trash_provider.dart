import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrashProvider with ChangeNotifier {
  int percentage1 = 0;
  int percentage2 = 0;
  int percentage3 = 0;
  int percentage4 = 0;

  int latlong1 = 0;
  int latlong2 = 0;
  int latlong3 = 0;
  int latlong4 = 0;

  Future<void> fetchAllPercentages() async {
    await fetchPercentage1();
    await fetchPercentage2();
    await fetchPercentage3();
    await fetchPercentage4();
  }

  Future<void> fetchPercentage1() async {
    final response = await http.get(Uri.parse(
        'https://gesit-gemastik-default-rtdb.asia-southeast1.firebasedatabase.app/distrik_a/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      latlong1 = data['tempat_sampah_a']['latlong'];
      percentage1 = data['tempat_sampah_a']['value'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> fetchPercentage2() async {
    final response = await http.get(Uri.parse(
        'https://gesit-gemastik-default-rtdb.asia-southeast1.firebasedatabase.app/distrik_a/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      latlong2 = data['tempat_sampah_b']['latlong'];
      percentage2 = data['tempat_sampah_b']['value'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> fetchPercentage3() async {
    final response = await http.get(Uri.parse(
        'https://gesit-gemastik-default-rtdb.asia-southeast1.firebasedatabase.app/distrik_a/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      latlong3 = data['tempat_sampah_c']['latlong'];
      percentage3 = data['tempat_sampah_c']['value'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> fetchPercentage4() async {
    final response = await http.get(Uri.parse(
        'https://gesit-gemastik-default-rtdb.asia-southeast1.firebasedatabase.app/distrik_a/.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      latlong4 = data['tempat_sampah_d']['latlong'];
      percentage4 = data['tempat_sampah_d']['value'];
      notifyListeners();
    } else {
      log('Failed to load data: ${response.statusCode}');
    }
  }

}
