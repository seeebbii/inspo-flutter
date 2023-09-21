import 'dart:async';

import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/dimensions.dart';
import '../../widgets/inspo_button.dart';

class InspoMapAddAddressScreen extends StatefulWidget {
  InspoMapAddAddressScreen({Key? key}) : super(key: key);

  @override
  State<InspoMapAddAddressScreen> createState() =>
      _InspoMapAddAddressScreen();
}

class _InspoMapAddAddressScreen extends State<InspoMapAddAddressScreen> {
  /*GoogleMapController? _mapController;
  LocationData? _currentLocation;
  bool _locationPermissionGranted = false;
  Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> _checkLocationPermission() async {
    final location = Location();
    final granted = await location.hasPermission();
    if (granted == PermissionStatus.granted) {
      final locationData = await location.getLocation();
      setState(() {
        _currentLocation = locationData;
        _locationPermissionGranted = true;
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void _locateMe() {
    if (_locationPermissionGranted && _currentLocation != null) {
      final LatLng currentLatLng =
      LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLng, 15),
      );
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId("My Location"),
          position: currentLatLng,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(19), topLeft: Radius.circular(19)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: SvgPicture.asset("assets/icons/arrow_down.svg")),
              SizedBox(height: 25),
              Center(
                child: Text(
                  "WHERE DO YOU LIVE?",
                  style: Dimensions.customTextStyle(
                    15,
                    FontWeight.w700,
                    Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Center(
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 32,
                    width: 131,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: AppTheme.blackColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/compass.svg"),
                          SizedBox(width: 8),
                          Text(
                            "LOCATE ME",
                            style: Dimensions.customTextStyle(
                              13,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17),
              Container(
                child: Divider(
                  color: AppTheme.fieldOutlineColor,
                  thickness: 2,
                  height: 0,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Image.asset("assets/images/map_sample.png")
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/locator.svg"),
                            SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DELIVERY LOCATION",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w700,
                                    Colors.black,
                                  ),
                                ),
                                Text(
                                  "7xpg_fxp, kuwait",
                                  style: Dimensions.customTextStyle(
                                    15,
                                    FontWeight.w500,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 21),
                        InspoButton(
                          text: "CONFIRM LOCATION",
                          height: 56,
                          buttonColor: Colors.white,
                          buttonRadius: 9,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          borderWidth: 2,
                          onPressed: (){
                            context.push(AppRouter.inspoAddAddressScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
