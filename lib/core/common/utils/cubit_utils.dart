import '../../errors/app_errors.dart';
import '../../results/result.dart';

class CubitUtils {
  CubitUtils._();
 static AppErrors? checkError<T>(List<Result<AppErrors, T>> results) {
  for (int i = 0; i < results.length; i++) {
    if (results[i].hasErrorOnly) return results[i].error;
  }
  return null;
}
}
