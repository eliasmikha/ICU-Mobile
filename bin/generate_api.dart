import 'dart:io';

import 'dart:convert';
import '../lib/generate_api.dart' as auto_generate;

void main(List<String> arguments) async {
  final optionJson = await File("config.json").readAsString();
  final Map<String, dynamic> options = json.decode(optionJson);
  await auto_generate.generate(options);
}
