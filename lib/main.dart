import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_with_http_package/Product/Global/resource_context.dart';
import 'package:video_player_with_http_package/Product/Global/theme_settings.dart';
import 'package:video_player_with_http_package/Vision/req_res_vision.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ReqResContext()),
      ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => const _VideoPlayerMain(),
  ));
}

class _VideoPlayerMain extends StatelessWidget {
  // ignore: unused_element
  const _VideoPlayerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Video Player",
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const ReqResVision(),
      debugShowCheckedModeBanner: false,
    );
  }
}
