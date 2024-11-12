import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _initialPosition = LatLng(20.5937, 78.9629); // Default to India’s coordinates
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Method to get the current location
  Future<void> _getCurrentLocation() async {
    // Request location permission
    bool _serviceEnabled = await _location.requestService();
    PermissionStatus _permissionGranted = await _location.requestPermission();

    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      LocationData currentLocation = await _location.getLocation();

      setState(() {
        _initialPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _isLoading = false;
      });
    } else {
      // Handle permission not granted or service not enabled
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location Map"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner while fetching location
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
