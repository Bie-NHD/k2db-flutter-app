import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static const routeName = "/map_screen";
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = const CameraPosition(target: LatLng(37.4219999, -122.0862462),zoom: 14.4746 );
  static const CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(10.8456964,106.7915966),zoom: 14);
  // List<Marker> _marker = [];
  // List<Marker> _list =  [
  //   // Marker(
  //   //     markerId: MarkerId('1'),
  //   //     position: LatLng(12.9817054,109.3334809),
  //   //   infoWindow: InfoWindow(
  //   //     title: 'My current position',
  //   //   )
  //   // ),
  //   // Marker(
  //   //     markerId: MarkerId('2'),
  //   //     position: LatLng(12.9734716,109.3349126),
  //   //     infoWindow: InfoWindow(
  //   //       title: 'Thế giới di động',
  //   //     )
  //   // ),
  //   // Marker(
  //   //     markerId: MarkerId('3'),
  //   //     position: LatLng(37.4219999, -122.0862462),
  //   //     infoWindow: InfoWindow(
  //   //       title: 'Test',
  //   //     )
  //   // ),
  //   Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(33.6844,73.0479),
  //     infoWindow: InfoWindow(
  //       title: 'The title of the marker',
  //     )
  //   )
  // ];
  final List<Marker> _markers =  <Marker>[
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(33.6844,73.0479),
        infoWindow: InfoWindow(
          title: 'The title of the marker',
        )
      )
  ];
  loadData(){
    getUserCurrentLocation().then((value) async {
      _markers.add(
          Marker(
              markerId: MarkerId('2'),
              position: LatLng(value.latitude,value.longitude),
              infoWindow: InfoWindow(
                title: 'My current position',
              )
          )
      );

      CameraPosition cameraPosition = CameraPosition(
          zoom: 14,
          target: LatLng(value.latitude,value.longitude));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });
    });
  }

  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print("error"+error.toString());
    });
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // @override
  // void initState(){
  //   super.initState();
  //   _marker.addAll(_list);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_markers),
          // compassEnabled: false,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child:  Icon(Icons.location_disabled_outlined),
        // onPressed: () async {
        //   GoogleMapController controller = await _controller.future;
        //   controller.animateCamera(CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //         target: LatLng(12.9702917,109.3358001),
        //         zoom: 14
        //     )
        //   ));
        // },
        onPressed: () async {


        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}
