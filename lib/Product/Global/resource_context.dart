import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';

class ReqResContext {
  ReqResModel? _model;
  void saveModel(ReqResModel model) {
    _model = model;
  }

  void clear() {
    _model = null;
  }
}
