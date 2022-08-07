import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_room_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/repositories/repository.dart';
import '../../data/datasource/iroom_remote.dart';

part 'room_repository.dart';

abstract class IRoomRepository extends Repository {
	Future<Result<AppErrors, EmptyResponse>> addRoom(AddRoomParam param);
}
