import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final geolocator = Geolocator();
  late Position _position;
  Future<Map<String, double?>?> initializeAndGetLocation(
      BuildContext context) async {
    final isPermissionEnabled = await Geolocator.isLocationServiceEnabled();
    final permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    if (isPermissionEnabled) {
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } else {
      await Geolocator.requestPermission();
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    log('Location: $_position', name: 'LocationService');
    return {
      'latitude': _position.latitude,
      'longitude': _position.longitude,
    };
  }
}
