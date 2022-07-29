import 'package:dio/dio.dart';
import 'package:starter_application/core/params/base_params.dart';

class UploadFileParam extends BaseParams {
  final String imageUrl;
  final ProgressCallback onSendProgress;
  final ProgressCallback onReceiveProgress;

  UploadFileParam({
    required this.imageUrl,
    required this.onSendProgress,
    required this.onReceiveProgress,
  });

  @override
  Map<String, dynamic> toMap() => {};
}
