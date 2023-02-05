import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Product/ServiceManager/dio_service_manager.dart';
import 'package:video_player_with_http_package/Service/req_res_service.dart';
import 'package:video_player_with_http_package/Vision/req_res_vision.dart';

abstract class ReqResVisionModel extends State<ReqResVision>
    with DioServiceMixin {
  late final IReqResService reqResService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqResService = ReqResService(dio: reqResDioInstance);
  }
}
