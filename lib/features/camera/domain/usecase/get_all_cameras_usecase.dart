import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/params/no_params.dart';
import '../entity/camera_entity.dart';
import '../repository/icamera_repository.dart';

@singleton
class GetAllCamerasUsecase extends UseCase<List<CameraEntity>, NoParams> {
	final ICameraRepository repository;

	GetAllCamerasUsecase(this.repository);

	@override
	Future<Result<AppErrors, List<CameraEntity>>> call(NoParams param) async {
		return await repository.getAllCameras();
	}
}
