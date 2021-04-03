import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class IniciaPage extends StatefulWidget {
  @override
  _IniciaPageState createState() => _IniciaPageState();
}

class _IniciaPageState extends State<IniciaPage> {
  GoogleMapController _controller;
  Marker marker;
  Circle circle;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context)
        .load("lib/imagens/marker_green.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("Localização Atual"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("Você"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue[200],
          center: latlng,
          fillColor: Colors.blue[200].withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8894901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print("PERMISSÃO NEGADA");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(45.521563, -122.677433),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("zzzz"),
              accountEmail: Text("Ex@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("ZZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text("Realizar denúncia"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Desconectar"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            )
          ],
        ),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: initialLocation,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () {
          getCurrentLocation();
        },
      ),
    );
  }
}
