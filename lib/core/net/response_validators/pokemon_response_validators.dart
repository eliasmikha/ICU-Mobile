import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/net/response_validators/response_validator.dart';

class PokemonResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data["count"] == null) {
      error = const AppErrors.customError(message: "Couldn't get your pokemons");
      errorMessage = "Couldn't get your pokemons";
    }
  }
}
