import 'package:starter_application/core/net/create_model_interceptor/create_model.interceptor.dart';

class AllDataCreateModel extends CreateModelInterceptor {
  const AllDataCreateModel();
  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    return modelCreator(json);
  }
}
