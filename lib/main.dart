import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController; //controller for google map
  Set<Marker> markers = {}; // markers for google map
  LatLng showLocation =
      const LatLng(18.16, 96.1); // location to show in map

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(showLocation.toString()),
      position: showLocation,
      infoWindow:const InfoWindow(
        title: "My Custom Title",
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map in Flutter"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: showLocation,
          zoom: 10.0,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
