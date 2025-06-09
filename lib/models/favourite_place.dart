import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation(
      {required this.latitude, required this.longitude, required this.address});

  final double longitude;
  final double latitude;
  final String address;
}

class FavouritePlace {
  FavouritePlace({
    String? idProvided,
    required this.title,
    required this.imageFile,
    required this.location,
  }) {
    id=idProvided ?? uuid.v4();
  }

  late final String id;
  final String title;
  final File imageFile;
  final PlaceLocation location;
}
