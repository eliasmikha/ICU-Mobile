import 'package:dartz/dartz.dart';
import 'package:starter_application/core/datasources/remote_data_source.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/features/home/data/model/request/mock_request.dart';
import 'package:starter_application/features/home/data/model/response/people_model.dart';

abstract class IHomeRemoteSource extends RemoteDataSource {
  /// Test APIs
  Future<Either<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testValidator(MockRequest mockRequest);
  Future<Either<AppErrors, PeopleDataModel>> getPeople(MockRequest mockRequest);
}
