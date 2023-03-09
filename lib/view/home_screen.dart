import 'package:flutter/material.dart';
import 'package:flutter_maps/controller/map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: Consumer(
        builder: (context, value, child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: provider.currentLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              provider.uMapController = controller;
              provider.addMarker('test', provider.currentLocation);
            },
            markers: provider.uMarkers.values.toSet(),
          );
        },
      ),
    );
  }
}
