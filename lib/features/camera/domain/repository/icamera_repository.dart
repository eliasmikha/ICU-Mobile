import '../entity/camera_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/repositories/repository.dart';
import '../../data/datasource/icamera_remote.dart';

part 'camera_repository.dart';

abstract class ICameraRepository extends Repository {
  

	Future<Result<AppErrors, List<CameraEntity>>> getAllCameras();
}
