import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider with ChangeNotifier {
  LatLng currentLocation = const LatLng(25.1193, 55.3773);

  late GoogleMapController uMapController;
  final Map<String, Marker> uMarkers = {};

  addMarker(String id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title of place',
        snippet: 'Some description of the place',
      ),
    );

    uMarkers[id] = marker;
    notifyListeners();
  }
}
