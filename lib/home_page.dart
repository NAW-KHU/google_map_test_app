import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    setPermissions();
  }
  void setPermissions() async{
    PermissionStatus status = await Permission.location.request();
    if (status!= PermissionStatus.granted){
      return;
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _marker = {
    const Marker(
      markerId: MarkerId('Times City'),
      position: LatLng(16.81605105, 96.12887631),
      infoWindow: InfoWindow(
        title: 'Times City',
        snippet: 'Office Tower',
      )
      )
  };
  static const CameraPosition kGoogle = CameraPosition(
    target: LatLng(16.81605105, 96.12887631),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F9D58),
        title: const Text("Google Maps in Flutter"),
      ),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: kGoogle,
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: _marker
        ),
      ),
    );
  }
}

