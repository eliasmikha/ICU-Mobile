import 'package:dartz/dartz.dart';
import 'package:starter_application/core/datasources/remote_data_source.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/features/account/data/model/request/login_request.dart';
import 'package:starter_application/features/account/data/model/request/register_request.dart';
import 'package:starter_application/features/account/data/model/response/login_model.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<AppErrors, EmptyResponse>> register(RegisterRequest registerRequest);
}
