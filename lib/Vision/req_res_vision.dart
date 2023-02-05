import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Service/req_res_service.dart';
import 'package:video_player_with_http_package/VisionModel/req_res_visionmodel.dart';

class ReqResVision extends StatefulWidget {
  const ReqResVision({Key? key}) : super(key: key);

  @override
  State<ReqResVision> createState() => _ReqResVisionState();
}

class _ReqResVisionState extends ReqResVisionModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ReqResVision'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return const Text("");
          },
        ));
  }
}
