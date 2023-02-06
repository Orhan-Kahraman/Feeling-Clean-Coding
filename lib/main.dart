import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Vision/req_res_vision.dart';
import 'package:video_player_with_http_package/Vision/service_vision.dart';

void main() {
  runApp(const _VideoPlayerMain());
}

class _VideoPlayerMain extends StatelessWidget {
  // ignore: unused_element
  const _VideoPlayerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Video Player",
      theme: ThemeData.dark(),
      home: const ReqResVision(),
      debugShowCheckedModeBanner: false,
    );
  }
}
