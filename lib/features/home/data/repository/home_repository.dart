import 'package:injectable/injectable.dart';
import 'package:starter_application/core/common/extensions/either_error_model_extension.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/home/data/datasource/ihome_remote.dart';
import 'package:starter_application/features/home/data/model/request/mock_request.dart';
import 'package:starter_application/features/home/domain/entity/comments_entity.dart';
import 'package:starter_application/features/home/domain/entity/people_entity.dart';
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart';

import '../model/response/comments_model.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource iHomeRemoteSource;

  HomeRepository(this.iHomeRemoteSource);

  @override
  Future<Result<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testFailure(mockRequest);
    return remote.result<EmptyResponse>();
  
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testSuccess(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testValidator(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.getPeople(mockRequest);
    return remote.result<PeopleDataEntity>();
  }
}
