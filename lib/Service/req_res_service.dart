import 'dart:io';

import 'package:dio/dio.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';

abstract class IReqResService {
  IReqResService({required this.dio});
  final Dio dio;

  Future<ReqResModel?> fetchReqResItems();
}

class ReqResService extends IReqResService {
  ReqResService({required super.dio});

  @override
  Future<ReqResModel?> fetchReqResItems() async {
    final response = await dio.get('/unknown');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return ReqResModel.fromJson(data);
      }
    }
    return null;
  }
}

enum ReqResRequestTypes { get }

extension ReqResExtansion on ReqResRequestTypes {}
