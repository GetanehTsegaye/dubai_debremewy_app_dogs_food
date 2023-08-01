import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChurchScreen extends StatelessWidget {
  final LatLng churchLocation = LatLng(37.7749, -122.4194); // Example church location coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: churchLocation,
                zoom: 15,
              ),
              markers: Set<Marker>.from([
                Marker(
                  markerId: MarkerId('church'),
                  position: churchLocation,
                  infoWindow: InfoWindow(
                    title: 'Church Name',
                    snippet: 'Church Address',
                  ),
                ),
              ]),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Church Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Church Address',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChurchScreen(),
  ));
}
