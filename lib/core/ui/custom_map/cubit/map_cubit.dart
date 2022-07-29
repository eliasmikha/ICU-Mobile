import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/ui/custom_map/api/datasource/map_remote_datasource.dart';
import 'package:starter_application/core/ui/custom_map/api/model/map_distance_model.dart';
import 'package:starter_application/core/ui/custom_map/api/params/map_distance_params.dart';
import 'package:starter_application/generated/l10n.dart';

// import 'package:promoter/generated/l10n.dart';
// import 'package:promoter/ui/widgets/map/custom_map/api/datasource/map_remote_datasource.dart';
// import 'package:promoter/ui/widgets/map/custom_map/api/model/map_distance_model.dart';
// import 'package:promoter/ui/widgets/map/custom_map/api/params/map_distance_params.dart';
import '../extension/custom_map_either_error_model_extension.dart';

part 'map_cubit.freezed.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState.mapInitial());

  Future<void> getDistance(
    MapDistanceParam param, {
    required BuildContext context,
  }) async {
    emit(const MapState.mapLoading());
    var mapDatasource = MapRemoteDataSource();
    final result = (await mapDatasource.getDistance(param)).result;

    if (result.hasErrorOnly) {
      emit(
        MapState.mapError(
          error: result.error!,
          callback: () {
            this.getDistance(
              param,
              context: context,
            );
          },
        ),
      );
    } else if (result.hasDataOnly) {
      if ((result.data?.rows.length ?? 0) > 0 &&
          (result.data?.rows[0].elements.length ?? 0) > 0 &&
          result.data!.rows[0].elements[0].duration != null &&
          result.data!.rows[0].elements[0].distance != null) {
        emit(
          MapState.mapDistanceLoaded(
            mapDistanceResult: result.data!,
          ),
        );
      } else {
        emit(
          MapState.mapError(
            error: CustomError(
              message: result.data?.rows[0].elements[0].status ??
                  // Todo Add translation
                  S.current.errorFetchDistance,
            ),
            callback: () {
              this.getDistance(
                param,
                context: context,
              );
            },
          ),
        );
      }
    }
  }
}
