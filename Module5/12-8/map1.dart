import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapEx extends StatefulWidget 
{
  const MyMapEx({super.key});

  @override
  State<MyMapEx> createState() => _MyMapExState();
}

class _MyMapExState extends State<MyMapEx> 
{
  String _locationMessage = "";
  double t11=0.00000;
  double t22=0.00000;
  LatLng? latLng;

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
      (
        appBar: AppBar(),
        body: GoogleMap( initialCameraPosition:CameraPosition(target: latLng!,zoom: 20.00)),
      );
  }

  Future<void> _getCurrentLocation()async
  {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied)
    {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever)
    {
      setState(() {
        _locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      t11 = position.latitude;
      t22 = position.longitude;
      latLng = LatLng(t11, t22);
    });


  }
}
