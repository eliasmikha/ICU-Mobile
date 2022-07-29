import 'package:starter_application/core/params/base_params.dart';

class PageParam extends BaseParams {
  final int? page;
  final int? pageLength;

  PageParam({
    this.page,
    this.pageLength,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      if (page != null) 'page': page,
      if (pageLength != null) 'pageLength': pageLength,
    };
  }
}
