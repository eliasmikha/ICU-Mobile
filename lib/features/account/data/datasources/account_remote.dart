import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_application/core/constants/enums/http_method.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/net/api_url.dart';
import 'package:starter_application/features/account/data/model/request/login_request.dart';
import 'package:starter_application/features/account/data/model/request/register_request.dart';
import 'package:starter_application/features/account/data/model/response/login_model.dart';
import 'package:starter_application/features/account/data/model/response/register_model.dart';

import 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest) async {
    // await Future.delayed(const Duration(seconds: 2));
    // if (loginRequest.phoneNumber == "0931607158" &&
    //     loginRequest.password == "12345678") {
    //   return Right(
    //     LoginModel(
    //       account: AccountModel(
    //         name: 'Issa Kalloumah',
    //         id: "1",
    //         imageUrl: "",
    //       ),
    //       token: "token123",
    //     ),
    //   );
    // } else
    //   return const Left(CustomError(message: "Phone or password is wrong."));
    return await request(
      converter: (json) => LoginModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.LOGIN_API,
      body: loginRequest.toMap(),
      cancelToken: loginRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> register(
      RegisterRequest registerRequest) async {
    return await request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.REGISTER_API,
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
  }
}
