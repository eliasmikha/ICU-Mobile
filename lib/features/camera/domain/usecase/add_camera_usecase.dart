import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_camera_param.dart';
import '../repository/icamera_repository.dart';

@singleton
class AddCameraUsecase extends UseCase<EmptyResponse, AddCameraParam> {
	final ICameraRepository repository;

	AddCameraUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddCameraParam param) async {
		return await repository.addCamera(param);
	}
}
