import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  LatLng? currentUserLocation;
  List<LatLng> routePoints = [];

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentUserLocation = LatLng(position.latitude, position.longitude);
    notifyListeners();
  }

  void setRoute(LatLng destination) {
    if (routePoints.isNotEmpty && routePoints.last == destination) {
      routePoints.clear(); // Clear the route if the same marker is clicked again
    } else {
      routePoints = [currentUserLocation!, destination];
    }
    notifyListeners();
  }
}
