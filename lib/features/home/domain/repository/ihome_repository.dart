import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/repositories/repository.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/home/data/model/request/mock_request.dart';
import 'package:starter_application/features/home/domain/entity/people_entity.dart';

abstract class IHomeRepository extends Repository {
  /// Test APIs
  Future<Result<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testValidator(MockRequest mockRequest);
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(MockRequest mockRequest);
}

