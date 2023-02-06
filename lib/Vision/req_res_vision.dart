import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';
import 'package:video_player_with_http_package/Product/Extensions/string_to_color.dart';
import 'package:video_player_with_http_package/Vision/service_vision.dart';
import 'package:video_player_with_http_package/VisionModel/req_res_visionmodel.dart';

class ReqResVision extends StatefulWidget {
  const ReqResVision({Key? key}) : super(key: key);

  @override
  State<ReqResVision> createState() => _ReqResVisionState();
}

class _ReqResVisionState extends ReqResVisionModel with CustomPadding {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ReqResVision'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: smallPaddingAll,
                itemCount: response.length,
                itemBuilder: (context, index) {
                  return ReqResCard(model: response[index]);
                },
              ));
  }
}

class ReqResCard extends StatelessWidget {
  const ReqResCard({
    super.key,
    required Data model,
  }) : _model = model;

  final Data _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: _model.color?.colorName,
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text("${_model.name}"),
        subtitle: Text("${_model.year}"),
      ),
    );
  }
}
