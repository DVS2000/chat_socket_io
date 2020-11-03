import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_socket/App/store/socket_store.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  Location location = new Location();
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  String mylocationString = "";

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-8.9192257,13.1902455),
    zoom: 14.4746,
  );


  final socketStore = SocketStore();


  Future<void> serviceEnable() async {

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
  
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    location.getLocation().then((value) async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 17.4746,
          target: LatLng(value.latitude, value.longitude)
        )
      ));


      setMapPin(position: LatLng(value.latitude, value.longitude));

      listenLocation();
      
    });
  }



  void setMapPin({LatLng position}) {
    setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId("mylocation"),
            position: position,
            infoWindow: InfoWindow(title: "Minha localizção") 
          )
        );
      });
  }


  listenLocation() async {
     location.onLocationChanged.listen((position) {
      setMapPin(position: LatLng(position.latitude, position.longitude));
      socketStore.sendSms(sms: "Latitude: ${position.latitude} || Longitude: ${position.longitude}".toString());
      setState(() {
        mylocationString = ("Latitude: ${position.latitude} || Longitude: ${position.longitude}");
      });
    });
  }

  @override
  void initState() {
    socketStore.connect();
    serviceEnable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          mylocationString,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: GoogleMap(
        markers: _markers,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}