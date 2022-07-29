import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/net/response_validators/response_validator.dart';

class TestResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data["message"].toString().contains("Fail")) {
      error = AppErrors.customError(message: data["message"]);
      errorMessage = data["message"];
    }
  }
}
