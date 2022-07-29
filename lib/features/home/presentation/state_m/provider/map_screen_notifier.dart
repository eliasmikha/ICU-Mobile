import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/custom_map/logic/custom_marker.dart';
import 'package:starter_application/core/ui/custom_map/logic/map_utils.dart';
import 'package:starter_application/core/ui/custom_map/widget/custom_map.dart';
import '../../../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/ui/custom_map/logic/location_wrapper.dart';

class MapScreenNotifier extends ScreenNotifier {
  AgentScreenNotifier() {}

  /// Fields
  late BuildContext context;
  var customMapKey = GlobalKey<CustomMapState>();

  /// Flutter location
  final LatLng flutterLocation = AppConstants.API_INITIAL_MAP_LOCATION;
  late LatLng newLatLng;

  /// CustomMap fields
  Uint8List? userMarkerIcon;
  Uint8List? unSelectedMarkerIcon;
  late final GoogleMapController? controller;

  /// custom markers list
  List<CustomMarker> markers = [];
  CustomMarker? myLocationMarker;

  final double infoWindowWidth = 250.w;
  final double infoWidnowHeight = 100.h;
  final double markerInfoWindowOffset = 250.h;

  final double userInfoWindowWidth = 250.w;
  final double userInfoWidnowHeight = 100.h;
  final double userMarkerOffset = 250.h;

  /// distance window variables
  final distanceWindowHeight = 80.h;
  final distanceWindowWidth = 200.w;

  bool isMapCreated = false;

  /// Getters and Setters

  /// Methods

  Future<void> onMapCreated(
      BuildContext context, GoogleMapController? conteroller) async {
    controller = conteroller;
    isMapCreated = true;
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    return MapUtils.getBytesFromAsset(
      path,
      width,
    );
  }

  Future<void> setMarkersIcons() async {
    final int size = ScreenUtil().setHeight(400).floor();
    unSelectedMarkerIcon =
        await getBytesFromAsset(AppConstants.APP_FLUTTER_MARKER, size);

    userMarkerIcon =
        await getBytesFromAsset(AppConstants.APP_USER_MARKER, size);
  }

  Future<void> setMarkers(
    BuildContext context,
  ) async {
    myLocationMarker = CustomMarker(
        unSelectedIcon: userMarkerIcon,
        customInfoWindowWidth: userInfoWindowWidth,
        customInfoWindowVOffset: userMarkerOffset,
        customInfoWindowHeight: userInfoWidnowHeight,
        markerId: const MarkerId("you"),
        customInfoWindow: () => Container(
              color: Colors.white,
              width: userInfoWindowWidth,
              height: userInfoWidnowHeight,
              child: const Center(
                child: FittedBox(
                  child: Text("You"),
                ),
              ),
            ),
        onTap: () {
          // notifyListeners();
        });

    markers.add(
      CustomMarker(
        unSelectedIcon: unSelectedMarkerIcon,
        location: flutterLocation,
        customInfoWindowWidth: infoWindowWidth,
        customInfoWindowHeight: infoWidnowHeight,
        customInfoWindowVOffset: markerInfoWindowOffset,
        customInfoWindow: () => Container(
          color: Colors.white,
          width: infoWindowWidth,
          height: infoWidnowHeight,
          child: const Center(
            child: FittedBox(
              child: Text("Flutter"),
            ),
          ),
        ),
        markerId: const MarkerId("1"),
      ),
    );
  }

  @override
  void closeNotifier() {
    this.dispose();
  }

  void onGoToMyLocationTap() async {
    if (controller != null) {
      final location = await LocationWrapper.singleton().getMyLocation();
      if (location != null &&
          location.latitude != null &&
          location.longitude != null) {
        final latLng = LatLng(location.latitude!, location.longitude!);
        controller!.animateCamera(CameraUpdate.newLatLng(latLng));
      }
    }
  }
}
