import 'dart:io';

Map<String, dynamic> _keyClassNames = {};
late Map<String, dynamic> _jsonConfig;
Map<String, List<String>> _fileNames = {};
String paramName = '';

Future<void> generate(Map<String, dynamic> options) async {
  _jsonConfig = options;
  Map<String, dynamic> response = _jsonConfig['response'];
  if (response.isNotEmpty) {
    _generateEntity();
    _fileNames.clear();
    _keyClassNames.clear();
    _generateModel();
    _fileNames.clear();
    _keyClassNames.clear();
  }
  Map<String, dynamic> param = _jsonConfig['param'];
  if (param.isNotEmpty) {
    _generateParam();
    _fileNames.clear();
    _keyClassNames.clear();
  }
  await _generateDataSourceInterface();
  await _generateDataSource();
  await _generateRepositoryInterface();
  await _generateRepository();
  _generateUsecase();
  await _generateState();
  await _generateCubit();
  paramName = '';
  _fileNames.clear();
  _keyClassNames.clear();
  _jsonConfig.clear();
}

Future<void> _generateState() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path = _jsonConfig['path'] +
      "/presentation/state_m/cubit/${featureName}_state.dart";
  String state = _jsonConfig['state'];
  final file = File(path);
  String content = await file.readAsString();
  String toAdd = "\n\tconst factory ${toPascalCase(featureName)}State.$state(";
  bool isList = _jsonConfig['isList'];
  Map<String, dynamic> object = _jsonConfig['response'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Entity" : "";
  toAdd += objectName.isNotEmpty
      ? "\n\t\t${isList ? "List<$objectName>" : objectName} ${featureName}Entity,\n"
      : "";
  toAdd += "\t) = ${toPascalCase(state)}State;\n";
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

Future<void> _generateCubit() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path = _jsonConfig['path'] +
      "/presentation/state_m/cubit/${featureName}_cubit.dart";
  String state = _jsonConfig['state'];
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  final file = File(path);
  String content = await file.readAsString();
  String param = paramName.isNotEmpty ? "$paramName param" : "";
  String toAdd = "\n\tvoid $function($param) async {\n";
  toAdd +=
      "\t\temit(const ${toPascalCase(featureName)}State.${featureName}Loading());\n\n";
  toAdd +=
      "\t\tfinal result = await getIt<${toPascalCase(function)}Usecase>()(${param.isEmpty ? "NoParams()" : "param"});\n\n";
  toAdd += "\t\tresult.pick(\n";
  toAdd += "\t\t\tonData: (data) {\n";
  toAdd +=
      "\t\t\t\temit(${object.isEmpty ? "const " : ""}${toPascalCase(featureName)}State.$state(${object.isEmpty ? "" : "data"}));\n";
  toAdd += "\t\t\t},\n";
  toAdd += "\t\t\tonError: (error) {\n";
  toAdd +=
      "\t\t\t\temit(${toPascalCase(featureName)}State.${featureName}Error(error, () => $function(${param.isEmpty ? "" : "param"})));\n";
  toAdd += "\t\t\t},\n";
  toAdd += "\t\t);\n";
  toAdd += "\t}\n";
  String imports =
      "import '../../../domain/usecase/${classFileName(toPascalCase(function), "usecase")}';\n"
      "${paramName.isNotEmpty ? "import '../../../data/request/param/${paramName.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase()}.dart';\n" : ""}"
      "${object.isNotEmpty ? "import '../../../domain/entity/${classFileName(_jsonConfig['className'], 'entity')}';\n" : ""}";
  content =
      imports + content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

void _generateUsecase() {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Entity" : "EmptyResponse";
  String imports = "import 'package:injectable/injectable.dart';\n\n"
      "import '../../../../core/errors/app_errors.dart';\n"
      "import '../../../../core/results/result.dart';\n"
      "import '../../../../core/usecases/usecase.dart';\n";
  imports += paramName.isEmpty
      ? "import '../../../../core/params/no_params.dart';\n"
      : "";
  imports += object.isEmpty
      ? "import '../../../../core/models/empty_response.dart';\n"
      : "import '../entity/${classFileName(_jsonConfig['className'], 'entity')}';\n";
  imports += paramName.isNotEmpty
      ? "import '../../data/request/param/${paramName.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase()}.dart';\n"
      : "";
  imports += "import '../repository/i${featureName}_repository.dart';\n";
  String param = paramName.isNotEmpty ? "$paramName param" : "";
  String content =
      "\n@singleton\nclass ${toPascalCase(function)}Usecase extends UseCase<${isList ? "List<$objectName>" : objectName}, ${paramName.isEmpty ? "NoParams" : paramName}> {\n";
  content += "\tfinal I${toPascalCase(featureName)}Repository repository;\n\n";
  content += "\t${toPascalCase(function)}Usecase(this.repository);\n\n";
  content +=
      "\t@override\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> call($param) async {\n";
  content += "\t\treturn await repository.$function(param);\n";
  content += "\t}\n}\n";
  content = imports + content;
  String path = _jsonConfig['path'] +
      "/domain/usecase/${classFileName(toPascalCase(function), "usecase")}";
  final file = File(path);
  file.writeAsString(content);
}

void _generateParam(
    {String? className, Map<String, dynamic>? map, String? fatherClassName}) {
  String name = className ?? _jsonConfig['function'];
  name = toPascalCase(name);
  if (paramName.isEmpty) paramName = name + "Param";
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['param'];
  String configPath = _jsonConfig['path'];
  String content = "";
  content += "class ${name}Param extends BaseParams {";
  content += _getVariablesAndConstructor(response, name, null);
  content += _getParamClassContent(response);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  content =
      "import '../../../../../core/params/base_params.dart';\n\n" + content;
  String fileName = classFileName(name, "param");
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath + "/data/request/param/" + fileName;
  final file = File(path);
  file.writeAsString(content);
}

String _getParamClassContent(Map<String, dynamic> map) {
  String content = "\n\n\t@override\n\tMap<String, dynamic> toMap() => {\n";
  map.forEach((key, value) {
    content += "\t\t\"$key\": ${_getToMapConverter(key, value)},\n";
  });
  content += "\t};";
  return content;
}

Future<void> _generateRepositoryInterface() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path = _jsonConfig['path'] +
      "/domain/repository/i${featureName}_repository.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Entity" : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param);\n";
  String import = object.isNotEmpty
      ? "import '../entity/${classFileName(_jsonConfig['className'], "entity")}';\n"
      : "import '../../../../core/models/empty_response.dart';\n";
  import += paramName.isNotEmpty
      ? "import '../../data/request/param/${paramName.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase()}.dart';\n"
      : "";
  content =
      import + content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

Future<void> _generateDataSourceInterface() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path =
      _jsonConfig['path'] + "/data/datasource/i${featureName}_remote.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Model" : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\tFuture<Either<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param);\n";
  String import = object.isNotEmpty
      ? "import '../request/model/${classFileName(_jsonConfig['className'], "model")}';\n"
      : "import '../../../../core/models/empty_response.dart';\n";
  import += paramName.isNotEmpty
      ? "import '../request/param/${paramName.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase()}.dart';\n"
      : "";
  content =
      import + content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

Future<void> _generateRepository() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path =
      _jsonConfig['path'] + "/domain/repository/${featureName}_repository.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Entity" : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\t@override\n\tFuture<Result<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param) async {\n";
  toAdd +=
      "\t\treturn ${object.isEmpty ? "executeForNoEntity" : isList ? "executeForList" : "execute"}(\n";
  toAdd += "\t\t\tremoteResult: await remoteDataSource.$function(param),\n";
  toAdd += '\t\t);\n\t}\n';
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

Future<void> _generateDataSource() async {
  String featureName = (_jsonConfig['path'] as String).split('/').last;
  String path =
      _jsonConfig['path'] + "/data/datasource/${featureName}_remote.dart";
  final file = File(path);
  String content = await file.readAsString();
  String function = _jsonConfig['function'];
  Map<String, dynamic> object = _jsonConfig['response'];
  bool isList = _jsonConfig['isList'];
  String objectName =
      object.isNotEmpty ? "${_jsonConfig['className']}Model" : "EmptyResponse";
  String param = paramName.isNotEmpty ? paramName + " param" : "";
  String toAdd =
      "\n\t@override\n\tFuture<Either<AppErrors, ${isList ? "List<$objectName>" : objectName}>> $function($param) async {\n";
  String httpMethod = _jsonConfig['method'];
  String url = _jsonConfig['url'];
  String paramType = _jsonConfig['paramType'];
  toAdd += "\t\treturn await ${isList ? "listRequest" : "request"}(\n";
  toAdd += "\t\t\tconverter: (json) => $objectName.fromMap(json),\n";
  toAdd += "\t\t\tmethod: HttpMethod.$httpMethod,\n";
  toAdd += "\t\t\turl: APIUrls.$url,\n";
  if (param.isNotEmpty) {
    toAdd += paramType == "query"
        ? "\t\t\tqueryParameters: param.toMap(),\n"
        : "\t\t\tbody: param.toMap(),\n";
  }
  toAdd += '\t\t);\n\t}\n';
  content = content.substring(0, content.lastIndexOf('}')) + toAdd + "}\n";
  file.writeAsString(content);
}

void _generateEntity(
    {String? className, Map<String, dynamic>? map, String? fatherClassName}) {
  String name = className ?? _jsonConfig['className'];
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['response'];
  String configPath = _jsonConfig['path'];
  String content = "";
  content += "class ${name}Entity extends BaseEntity {";
  content += _getVariablesAndConstructor(response, name, false);
  content += _getEntityClassContent(response);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  content =
      "import '../../../../../core/entities/base_entity.dart';\n\n" + content;
  String fileName =
      name.split(RegExp(r'(?=[A-Z])')).join('_').toLowerCase() + "_entity.dart";
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath + "/domain/entity/" + fileName;
  final file = File(path);
  file.writeAsString(content);
}

void _generateModel(
    {String? className, Map<String, dynamic>? map, String? fatherClassName}) {
  String name = className ?? _jsonConfig['className'];
  _fileNames[name] = [];
  Map<String, dynamic> response = map ?? _jsonConfig['response'];
  String configPath = _jsonConfig['path'];
  String content = "";
  content += "class ${name}Model extends BaseModel<${name}Entity> {";
  content += _getVariablesAndConstructor(response, name, true);
  content += _getModelClassContent(response, name);
  content += "\n}\n";
  String imports = "";
  _fileNames[name]?.forEach((element) {
    imports += "import '$element';\n";
  });
  if (imports.isNotEmpty) {
    content = imports + "\n" + content;
  }
  String classFileName =
      name.split(RegExp(r'(?=[A-Z])')).join('_').toLowerCase();
  content = "import 'dart:convert';\n\n"
          "import '../../../../../core/common/extensions/extensions.dart';\n"
          "import '../../../../../core/common/type_validators.dart';\n"
          "import '../../../../../core/models/base_model.dart';\n"
          "import '../../../domain/entity/${classFileName}_entity.dart';\n\n" +
      content;
  String fileName = "${classFileName}_model.dart";
  if (fatherClassName != null) _fileNames[fatherClassName]?.add(fileName);
  String path = configPath + "/data/request/model/" + fileName;
  final file = File(path);
  file.create();
  file.writeAsString(content);
}

String _getModelClassContent(Map<String, dynamic> map, String className) {
  String content =
      "\n\n\tfactory ${className}Model.fromMap(Map<String, dynamic>? map) =>\n\t\t${className}Model(";
  map.forEach((key, value) {
    content += "\n\t\t\t$key: ${_getMapConverter(key, value)},";
  });
  content += "\n\t\t);";
  content += "\n\n\tfactory ${className}Model.fromJson(String map) =>";
  content += "\n\t\t\t${className}Model.fromMap(json.decode(map));";
  content +=
      "\n\n\t@override\n\t${className}Entity toEntity() => ${className}Entity(";
  map.forEach((key, value) {
    content += "\n\t\t$key: $key${_getToEntityFromType(value.runtimeType)},";
  });
  content += "\n\t);";
  return content;
}

String _getToEntityFromType(Type? type) {
  switch (type) {
    case List:
      return ".toListEntity()";
    case int:
    case num:
    case double:
    case bool:
    case String:
    case DateTime:
      return "";
    default:
      return "?.toEntity()";
  }
}

String _getEntityClassContent(Map<String, dynamic> map) {
  String content = "\n\n\t@override\n\tList<Object?> get props => [";
  map.forEach((key, value) {
    content += "\n\t\t\t$key,";
  });
  content += "\n\t];";
  return content;
}

String _getVariablesAndConstructor(
    Map<String, dynamic> map, String className, bool? isModel) {
  String content = "";
  map.forEach((key, value) {
    if (value.runtimeType == List || isObject(value.runtimeType)) {
      bool isList = value.runtimeType == List;
      String childName = toPascalCase(key);
      _keyClassNames[key] = childName;
      isModel == null
          ? _generateParam(
              className: childName,
              map: isList
                  ? (map[key] as List).isNotEmpty
                      ? (map[key] as List).first
                      : {}
                  : Map<String, dynamic>.from(map[key]),
              fatherClassName: className,
            )
          : isModel
              ? _generateModel(
                  className: childName,
                  map: isList
                      ? (map[key] as List).isNotEmpty
                          ? (map[key] as List).first
                          : {}
                      : Map<String, dynamic>.from(map[key]),
                  fatherClassName: className,
                )
              : _generateEntity(
                  className: childName,
                  map: isList
                      ? (map[key] as List).isNotEmpty
                          ? (map[key] as List).first
                          : {}
                      : Map<String, dynamic>.from(map[key]),
                  fatherClassName: className,
                );
      if (isList) {
        content +=
            "\n\tfinal List<$childName${isModel == null ? "Param" : isModel ? "Model" : "Entity"}> $key;";
      } else {
        content +=
            "\n\tfinal $childName${isModel == null ? "Param" : isModel ? "Model" : "Entity"}? $key;";
      }
    } else {
      if (value.runtimeType == String &&
          DateTime.tryParse(value as String) != null) {
        content += "\n\tfinal DateTime? $key;";
      } else {
        content += '\n\tfinal ${_getStringFromType(value.runtimeType)} $key;';
      }
    }
  });
  content +=
      '\n\n\t$className${isModel == null ? "Param" : isModel ? "Model" : "Entity"}({';
  map.forEach((key, value) {
    content += '\n\t\trequired this.$key,';
  });
  content += '\n\t});';
  return content;
}

String _getMapConverter(String key, dynamic value) {
  String mapGetter = "map?[\"$key\"]";
  switch (value.runtimeType) {
    case int:
    case num:
    case double:
      return "numV($mapGetter)";
    case bool:
      return "boolV($mapGetter)";
    case String:
      return DateTime.tryParse(value as String) != null
          ? "dateTimeV($mapGetter)"
          : "stringV($mapGetter)";
    case DateTime:
      return "dateTimeV($mapGetter)";
    case List:
      return "$mapGetter == null ? [] : List<${_keyClassNames[key]}Model>.from($mapGetter.map((x) => ${_keyClassNames[key]}Model.fromMap(x)))";
    default:
      return "$mapGetter == null ? null : ${_keyClassNames[key]}Model.fromMap($mapGetter)";
  }
}

String _getToMapConverter(String key, dynamic value) {
  switch (value.runtimeType) {
    case int:
    case num:
    case double:
    case bool:
      return key;
    case String:
      return DateTime.tryParse(value as String) != null
          ? "$key?.toIso8601String()"
          : key;
    case DateTime:
      return "$key?.toIso8601String()";
    case List:
      return "$key.map((x) => x.toMap()).toList()";
    default:
      return "$key?.toMap()";
  }
}

String _getStringFromType(Type? type) {
  switch (type) {
    case List:
      return "List";
    case int:
      return "int?";
    case num:
      return "num?";
    case double:
      return "double?";
    case bool:
      return "bool";
    case DateTime:
      return "DateTime?";
    case String:
      return "String";
    case Object:
      return "Object?";
    default:
      return "Object?";
  }
}

String toPascalCase(String str) => str[0].toUpperCase() + str.substring(1);

String classFileName(String str, String suffix) =>
    str.split(RegExp(r'(?=[A-Z])')).join("_").toLowerCase() + "_$suffix.dart";

bool isObject(Type? type) {
  switch (type) {
    case int:
    case num:
    case double:
    case bool:
    case String:
    case DateTime:
    case List:
      return false;
    default:
      return true;
  }
}
