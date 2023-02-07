import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player_with_http_package/Models/req_res_model.dart';
import 'package:video_player_with_http_package/Product/Extensions/string_to_color.dart';
import 'package:video_player_with_http_package/Product/Global/theme_settings.dart';
import 'package:video_player_with_http_package/Product/constants/duration_const.dart';
import 'package:video_player_with_http_package/Product/constants/lottie_consts.dart';
import 'package:video_player_with_http_package/Vision/service_vision.dart';
import 'package:video_player_with_http_package/VisionModel/req_res_visionmodel.dart';

class ReqResVision extends StatefulWidget {
  const ReqResVision({Key? key}) : super(key: key);

  @override
  State<ReqResVision> createState() => _ReqResVisionState();
}

class _ReqResVisionState extends ReqResVisionModel
    with CustomPadding, TickerProviderStateMixin {
  late AnimationController lottieController;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    lottieController = AnimationController(
        vsync: this, duration: ConstDuration.durationQuick());
  }

  void themeChangerLottieIcon() async {
    await lottieController.animateTo(isLight ? 0.0 : 0.95);
    isLight = !isLight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [lottiewitget(context)],
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
            ),
    );
  }

  InkWell lottiewitget(BuildContext context) {
    return InkWell(
      onTap: () {
        themeChangerLottieIcon();
        context.read<ThemeNotifier>().changeTheme();
      },
      child: Lottie.asset(
        controller: lottieController,
        LottieItems.themeChange.lottiePath,
        repeat: false,
      ),
    );
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
