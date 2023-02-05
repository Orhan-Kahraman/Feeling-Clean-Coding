import 'package:dio/dio.dart';

mixin DioServiceMixin {
  final reqResDioInstance = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));
}
