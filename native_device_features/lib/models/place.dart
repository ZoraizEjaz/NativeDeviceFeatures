import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation(
    @required this.latitude,
    @required this.longitude,
    this.address,
  );
}

class Place {
  final String id;
  final String title;
  final PlaceLocation address;
  final File image;

  Place(
    @required this.id,
    @required this.title,
    @required this.address,
    @required this.image,
  );
}
