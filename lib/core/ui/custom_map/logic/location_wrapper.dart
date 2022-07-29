import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:starter_application/core/common/utils/permission_utils.dart';

import 'location_permissions_result.dart';

///
/// This class has location related functions
///
class LocationWrapper {
  static final _instance = LocationWrapper();

  factory LocationWrapper.singleton() {
    return _instance;
  }
  LocationWrapper({bool enableBackgroundMode = true}) {
    location.enableBackgroundMode(enable: enableBackgroundMode);
  }

  /// LocationData destinationLocation; // wrapper around the location API
  final loc.Location location = loc.Location();

  /// Map Location related functions

  /// Check if the Gps/locationService is enabled
  Future<bool> isLocationServiceEnabled() {
    return location.serviceEnabled();
  }

  Future<bool> requestGpsServiceActivation() async {
    bool _serviceEnabled = await isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    return Future.value(_serviceEnabled);
  }

  /// Check and request location permissions and location/Gps service activation
  Future<LocationPermissionsResult> checkLocationPermissions(
      {bool isForce = false}) async {
    /// Request the access to location permission, if access hasn't already been granted

    final result = await requestPermission(
      RequestPermissionsParam(
        location: isForce
            ? PermissionOption.ForcePermission
            : PermissionOption.DefaultPermission,
      ),
    );
    final permissionStatus = result[Permission.location]!;

    // Check if GPS service is active
    bool locationServiceEnabled = await isLocationServiceEnabled();
    // Request the activation of the location/GPS service
    if (!locationServiceEnabled) {
      locationServiceEnabled = await requestGpsServiceActivation();
      while (!locationServiceEnabled && isForce) {
        locationServiceEnabled = await requestGpsServiceActivation();
      }
    }
    return LocationPermissionsResult(
      permissionStatus: permissionStatus,
      locationServiceEnabled: locationServiceEnabled,
    );
  }

  /// Get the current location of the user
  Future<loc.LocationData?> getMyLocation() async {
    if ((await checkLocationPermissions()).success) {
      return await location.getLocation();
    }
    return null;
  }
}
