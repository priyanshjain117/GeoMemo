import 'dart:convert';

import 'package:favourite_places/helper/apikey.dart';
import 'package:favourite_places/models/favourite_place.dart';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  bool isGettingLocation = false;
  Widget? _previewImage;

  void _updateStaticMapPreview(double lat, double lng) {
    final staticMapUrl = 'https://static-maps.yandex.ru/1.x/'
        '?ll=$lng,$lat'
        '&z=17' // zoom level
        '&size=600,300' // image size
        '&l=sat,skl' // satellite + labels
        '&pt=$lng,$lat,pm2rdl'; // marker style

    setState(() {
      isGettingLocation = false;
      _previewImage = Image.network(
        staticMapUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text('Failed to load map'),
          );
        },
      );
    });
  }

  void _getCurrentLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData _locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      setState(() {
        isGettingLocation = true;
      });

      _locationData = await location.getLocation();

      double? lat = _locationData.latitude;
      double? lng = _locationData.longitude;

      if (lat == null || lng == null) {
        return;
      }
      final url = Uri.parse(
          'https://api.opencagedata.com/geocode/v1/json?q=$lat+$lng&key=$API_KEY');

      final response = await http.get(url);
      final String? formatted;
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        formatted = data['results'][0]['formatted'];
        print('Formatted Address: $formatted');
        _pickedLocation = PlaceLocation(
          latitude: lat,
          longitude: lng,
          address: formatted!,
        );
        _updateStaticMapPreview(lat, lng);
        widget.onSelectLocation(_pickedLocation!);
      } else {
        print('Failed to fetch address: ${response.body}');
      }
    } catch (e) {
      print('Error during reverse geocoding: $e');
    }
  }

  Future<void> _selectOnMap() async {
    final LatLng? selectedLatLng = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (ctx) => const MapScreen(),
      ),
    );
    if (selectedLatLng == null) return;

    final lat = selectedLatLng.latitude;
    final lng = selectedLatLng.longitude;

    setState(() {
      isGettingLocation = true;
    });

    _updateStaticMapPreview(lat, lng);

    try {
      final url = Uri.parse(
          'https://api.opencagedata.com/geocode/v1/json?q=$lat+$lng&key=$API_KEY');
      final response = await http.get(url);
      if (response.statusCode != 200) throw Exception('Failed');
      final data = json.decode(response.body);
      final formatted = data['results'][0]['formatted'] as String;

      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: formatted,
      );

      widget.onSelectLocation(_pickedLocation!);
    } catch (e) {
      setState(() => isGettingLocation = false);
      debugPrint('Reverse geocode failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: isGettingLocation
              ? CircularProgressIndicator()
              : _previewImage ??
                  Text(
                    "No location chosen",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text("Get current location"),
              onPressed: isGettingLocation ? null : _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.map_outlined,
              ),
              label: const Text("Select on Map"),
              onPressed: isGettingLocation ? null : _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
