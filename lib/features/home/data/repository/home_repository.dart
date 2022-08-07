import 'package:injectable/injectable.dart';

import '../../domain/repository/ihome_repository.dart';
import '../datasource/ihome_remote.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource iHomeRemoteSource;

  HomeRepository(this.iHomeRemoteSource);
}
