import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapAPI extends StatefulWidget {
  const GoogleMapAPI({Key? key}) : super(key: key);
  @override
  State<GoogleMapAPI> createState() => _GoogleMapAPI();
}

const LatLng currentLocation = LatLng(19.0222, 72.8561);

class _GoogleMapAPI extends State<GoogleMapAPI> {
  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      //zoomControlsEnabled: false,
      //myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(target: currentLocation, zoom: 21),
      onMapCreated: (controller) {
        _mapController = controller;
        addMarker("test", currentLocation);
      },
      markers: _markers.values.toSet(),
    ));
  }

  addMarker(String key, LatLng location) {
    var marker = Marker(
        markerId: MarkerId(key),
        position: location,
        infoWindow: const InfoWindow(
            title: "Hostel Location",
            snippet: "1.2 kms away from VJTI college"));
    _markers[key] = marker;
    setState(() {});
  }
}
