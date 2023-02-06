import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Product/Global/resource_context.dart';

import '../Models/req_res_model.dart';
import '../Service/req_res_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqResService reqResService;
  List<Data> response = [];
  bool isLoading = false;

  ReqResProvider(this.reqResService) {
    _fetchData();
  }
  //  reqResService = ReqResService(dio: reqResDioInstance);
  void _fetchData() async {
    _changeLoading();
    response = (await reqResService.fetchReqResItems())?.data ?? [];
    _changeLoading();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void savetoLocale(ReqResContext reqresContext) {
    reqresContext.saveModel(ReqResModel(data: response));
  }
}
