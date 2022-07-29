import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import '../../../../core/ui/custom_map/logic/custom_map_model.dart';
import '../../../../core/ui/widgets/waiting_widget.dart';
import '../screen/../state_m/provider/map_screen_notifier.dart';
import 'map_screen_content.dart';
class MapScreenParam{

}
class MapScreen extends BaseScreen<MapScreenParam> {
  static const String routeName = "/MapScreen";

  const MapScreen({Key? key, required MapScreenParam param}) : super(key: key, param: param);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final provider = MapScreenNotifier();
  final customMapModel = CustomMapModel();
  late final Future<Widget> mapFuture;

  @override
  void initState() {
    super.initState();
    mapFuture = _buildMapScreenContent();
  }

  @override
  void dispose() {
    provider.closeNotifier();
    customMapModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: provider,
        ),
        ChangeNotifierProvider.value(
          value: customMapModel,
        ),
      ],
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: _buildMapFutureBuilder(),
      ),
    );
  }

  Widget _buildMapFutureBuilder() {
    return FutureBuilder<Widget>(
        future: mapFuture,
        builder: (context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return const WaitingWidget();
          }
        });
  }

  Future<Widget> _buildMapScreenContent() async {
    await provider.setMarkersIcons();

    return MapScreenContent();
  }
}
