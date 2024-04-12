// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   GoogleMapController? mapController; //controller for google map
//   Set<Marker> markers = {}; // markers for google map
//   LatLng showLocation =
//       const LatLng(18.16, 96.1); // location to show in map

//   @override
//   void initState() {
//     markers.add(Marker(
//       markerId: MarkerId(showLocation.toString()),
//       position: showLocation,
//       infoWindow:const InfoWindow(
//         title: "My Custom Title",
//         snippet: 'My Custom Subtitle',
//       ),
//       icon: BitmapDescriptor.defaultMarker,
//     ));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Google Map in Flutter"),
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//       body: GoogleMap(
//         zoomControlsEnabled: true,
//         zoomGesturesEnabled: true,
//         initialCameraPosition: CameraPosition(
//           target: showLocation,
//           zoom: 10.0,
//           tilt: 0,
//           bearing: 0
//         ),
//         markers: markers,
//         mapType: MapType.normal,
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//       ),
//     );
//   }
// }

//


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final Set<Marker> _marker = {};
  final LatLng _center = const LatLng(16.81605105, 96.12887631);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker() {
    Marker marker = Marker(
        markerId: const MarkerId('Times City'),
        position: _center,
        infoWindow: const InfoWindow(
          title: 'Times City',
          snippet: 'Office Tower',
        ));
    setState(() {
      _marker.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green[700],
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Maps Sample App'),
            elevation: 2,
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,

            ),
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            markers: _marker,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addMarker();
            },
            child: const Icon(Icons.add_location),
          ),
        ));
  }
}


