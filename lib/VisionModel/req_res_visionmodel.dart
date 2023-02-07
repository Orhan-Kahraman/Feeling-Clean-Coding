import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';
import 'package:video_player_with_http_package/Product/ServiceManager/dio_service_manager.dart';
import 'package:video_player_with_http_package/Service/req_res_service.dart';
import 'package:video_player_with_http_package/Vision/req_res_vision.dart';

abstract class ReqResVisionModel extends LoadingStatefull<ReqResVision>
    with DioServiceMixin {
  late final IReqResService reqResService;
  List<Data> response = [];
  @override
  void initState() {
    super.initState();
    reqResService = ReqResService(dio: reqResDioInstance);
    _fetchData();
  }

  void _fetchData() async {
    changeLoading();
    response = (await reqResService.fetchReqResItems())?.data ?? [];
    changeLoading();
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
