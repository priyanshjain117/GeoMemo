import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  void _submitLocation() {
    if (_pickedLocation == null) {
      return;
    }
    Navigator.of(context).pop(
      _pickedLocation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        actions: [
          IconButton(
            onPressed: _pickedLocation == null ? null : _submitLocation,
            icon: Icon(
              Icons.check,
            ),
          )
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
            backgroundColor: const Color.fromARGB(226, 176, 232, 252),
            initialCenter: const LatLng(20.5937, 78.9629),
            initialZoom: 5.0,
            minZoom: 3.0,
            maxZoom: 18.0,
            onTap: (tapPosition, coordinates) {
              print(tapPosition.global);
              print(coordinates);
              setState(() {
                _pickedLocation = coordinates;
              });
            }),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.fav_place_app_by_priyanshu.app',
          ),
          if (_pickedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: _pickedLocation!,
                  width: 50,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 10,
                        color: Color.fromARGB(235, 245, 51, 51),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -25),
                        child: const Icon(
                          Icons.location_on,
                          size: 50,
                          color: Color.fromARGB(235, 245, 51, 51),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
