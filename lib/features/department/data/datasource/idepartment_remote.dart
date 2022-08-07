import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/datasources/remote_data_source.dart';
part 'department_remote.dart';

abstract class IDepartmentRemoteSource extends RemoteDataSource {}
