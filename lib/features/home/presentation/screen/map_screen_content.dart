import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/custom_map/widget/custom_map.dart';
import '../screen/../state_m/provider/map_screen_notifier.dart';

class MapScreenContent extends StatefulWidget {
  @override
  State<MapScreenContent> createState() => _MapScreenContentState();
}

class _MapScreenContentState extends State<MapScreenContent> {
  late MapScreenNotifier sn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MapScreenNotifier>().setMarkers(context);
  }

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<MapScreenNotifier>(context);
    sn.context = context;
    return Stack(
      children: [
        _buildCustomMap(),
        if (sn.isMapCreated) _buildAppbarGpsIcon(),
      ],
    );
  }

  Widget _buildAppbarGpsIcon() {
    return PositionedDirectional(
      top: 100.h,
      end: 100.h,
      child: Container(
        height: 130.h,
        width: 130.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Material(
            child: InkWell(
              onTap: () {
                sn.onGoToMyLocationTap();
              },
              child: Center(
                child: Icon(
                  Icons.gps_fixed,
                  color: Colors.black,
                  size: 60.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomMap() {
    return Positioned.fill(
      child: CustomMap(
        //Todo add assert to force adding those variables when having custom distance window and vice versa
        distanceWindowHeight: sn.distanceWindowHeight,
        distanceWindowWidth: sn.distanceWindowWidth,
        distanceInfoWindowEnabled: true,
        distanceWindowWidget: _buildDistanceWindow,
        initialIndex: 0,

        mapApiKey: AppConstants.API_KEY_GOOGLE_MAPS,
        polylinesColor: Colors.blue,
        disableMyLocationIcon: false,
        disableMyLocationButton: true,

        key: sn.customMapKey,
        markers: sn.markers,
        myLocationMarker: sn.myLocationMarker,
        onTap: (lat) {
          setState(() {});
        },
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: sn.flutterLocation,
          zoom: 15,
        ),
        onMapCreated: (controller) => sn.onMapCreated(context, controller),
      ),
    );
  }

  Widget _buildDistanceWindow(String distance, String time) {
    return SizedBox(
      height: sn.distanceWindowHeight,
      width: sn.distanceWindowWidth,
      child: Card(
        margin: const EdgeInsets.all(
          0,
        ),
        elevation: 1,
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  distance,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
