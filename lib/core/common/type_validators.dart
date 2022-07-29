/// Validators that be used to validate that the value is coming is true and -
/// the same value type we waiting for
/// The main use in Model classes to validate types of data which are coming -
/// from API

T? numV<T extends num>(Object? value) {
  if (value == null) return null;
  if (value is num) {
    return _getNum<T>(value);
  }
  if (value is String) {
    return _getNum<T>(num.tryParse(value));
  }

  return null;
}

T? _getNum<T extends num>(Object? value) {
  if (value == null) return null;

  /// If value is from type T(int/double)
  if (value is T) return value;

  /// If value is int and T is double
  if (value is int) return value.toDouble() as T;

  /// If value is double and T is int
  if (value is double) return value.toInt() as T;

  return null;
}

String stringV(Object? value) {
  if (value == null) return '';
  return value.toString().trim();
}

bool boolV(Object? value) {
  if (value == null) return false;
  if (value is String) {
    if (value.toLowerCase() == "true") return true;
  }
  if (value is num) {
    if (value == 1) return true;
  }
  if (value is bool) return value;
  return false;
}

DateTime? dateTimeV(String? dateTime) {
  if (dateTime == null) return null;
  return DateTime.tryParse(dateTime);
}

List<T> listV<T>(List<T?>? list) {
  if (list == null) return [];

  return list.whereType<T>().toList();
}
