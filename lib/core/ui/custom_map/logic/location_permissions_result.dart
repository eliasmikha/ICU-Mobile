import 'package:permission_handler/permission_handler.dart';

/// The result of [checkLocationPermissions]
///
/// If [success = true] then location permission is granted and location/Gps service is active
/// If [success = false] then location permission is not granted or location/Gps service is not active
class LocationPermissionsResult {
  final bool locationServiceEnabled;
  final PermissionStatus permissionStatus;
  LocationPermissionsResult({
    required this.locationServiceEnabled,
    required this.permissionStatus,
  });
  bool get success => permissionStatus.isGranted && locationServiceEnabled;
}
