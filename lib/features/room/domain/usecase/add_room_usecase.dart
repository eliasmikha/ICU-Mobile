import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_room_param.dart';
import '../repository/iroom_repository.dart';

@singleton
class AddRoomUsecase extends UseCase<EmptyResponse, AddRoomParam> {
	final IRoomRepository repository;

	AddRoomUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddRoomParam param) async {
		return await repository.addRoom(param);
	}
}
