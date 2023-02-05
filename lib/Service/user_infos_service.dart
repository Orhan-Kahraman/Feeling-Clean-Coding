import 'dart:io';

import 'package:dio/dio.dart';
import 'package:video_player_with_http_package/Models/user_infos_model.dart';

abstract class IUserService {
  Future<List<UserInfosModel>?> getItems();
  Future<bool> postUserItem(UserInfosModel model);
}

class UserService extends IUserService {
  final Dio _dio;
  UserService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<List<UserInfosModel>?> getItems() async {
    final response = await _dio.get(RequestType.posts.name);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => UserInfosModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<bool> postUserItem(UserInfosModel model) async {
    final response = await _dio.post(RequestType.posts.name, data: model);
    return response.statusCode == HttpStatus.created;
  }
}

enum RequestType { posts }
