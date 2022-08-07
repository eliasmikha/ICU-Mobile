import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/net/response_validators/response_validator.dart';

import '../../../generated/l10n.dart';

class ListResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (!(data['result'] is List) || !(data["success"] ?? false)) {
      if (data["error"]["message"] != null) {
        error = AppErrors.customError(message: data["error"]["message"]);
        errorMessage = data["error"]["message"];
      } else {
        error = AppErrors.customError(message: S.current.notValidResponse);
        errorMessage = S.current.notValidResponse;
      }
    }
  }
}
