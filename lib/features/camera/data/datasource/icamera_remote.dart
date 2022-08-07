import '../../../../core/models/empty_response.dart';
import '../request/param/add_camera_param.dart';
import 'package:starter_application/core/net/create_model_interceptor/all_data_create_model_interceptor.dart';

import '../request/model/camera_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/datasources/remote_data_source.dart';
part 'camera_remote.dart';

abstract class ICameraRemoteSource extends RemoteDataSource {
 

	Future<Either<AppErrors, List<CameraModel>>> getAllCameras();

	Future<Either<AppErrors, EmptyResponse>> addCamera(AddCameraParam param);
}
