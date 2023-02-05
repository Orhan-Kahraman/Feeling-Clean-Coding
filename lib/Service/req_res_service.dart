import 'dart:io';

import 'package:dio/dio.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';
import 'package:video_player_with_http_package/Service/user_infos_service.dart';

abstract class IReqResService {
  IReqResService({required this.dio});
  final Dio dio;

  Future<List<ReqResModel>?> fetchReqResItems();
}

class ReqResService extends IReqResService {
  ReqResService({required super.dio});

  @override
  Future<List<ReqResModel>?> fetchReqResItems() async {
    final response = await dio.get('/unknown');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => ReqResModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum ReqResRequestTypes { get }

extension ReqResExtansion on ReqResRequestTypes {}
