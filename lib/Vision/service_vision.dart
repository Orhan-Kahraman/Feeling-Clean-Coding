import 'package:flutter/material.dart';
import 'package:video_player_with_http_package/Models/user_infos_model.dart';
import 'package:video_player_with_http_package/Service/user_infos_service.dart';

class ServiceVision extends StatefulWidget {
  const ServiceVision({Key? key}) : super(key: key);

  @override
  State<ServiceVision> createState() => _ServiceVisionState();
}

class _ServiceVisionState extends State<ServiceVision> with CustomPadding {
  // Text Controllers
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  List<UserInfosModel>? _items;
  bool isLoad = false;
  late final IUserService _service;

  void changeState() {
    setState(() {
      isLoad = !isLoad;
    });
  }

  void geteer() async {
    changeState();
    await _service.getItems();
    changeState();
  }

  @override
  void initState() {
    super.initState();
    _service = UserService();
    Future.microtask(() => geteer());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('ServiceVision'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    Expanded(
                        flex: 7,
                        child: Padding(
                          padding: smallPaddingAll,
                          child: Column(
                            children: [
                              customTextFormField(
                                  text: "user id",
                                  type: TextInputType.number,
                                  controller: userIdController),
                              customTextFormField(
                                text: "title",
                                controller: titleController,
                              ),
                              customTextFormField(
                                text: "body",
                                controller: bodyController,
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: isLoad
                                ? null
                                : () {
                                    final UserInfosModel model = UserInfosModel(
                                        body: bodyController.text,
                                        title: titleController.text,
                                        userId: int.tryParse(
                                            userIdController.text));
                                    _service.postUserItem(model);
                                  },
                            child: const Text("Save"))),
                    const Spacer(flex: 2),
                  ],
                )),
            Expanded(
              flex: 4,
              child: !isLoad
                  ? ListView.builder(
                      padding: smallPaddingAll,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserCard(
                            smallPaddingBottom: smallPaddingBottom,
                            model: _items?[index]);
                      },
                      itemCount: _items?.length ?? 0,
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
          ],
        ));
  }

  Padding customTextFormField(
      {required String text,
      TextInputType type = TextInputType.text,
      TextEditingController? controller}) {
    return Padding(
      padding: smallPaddingBottom,
      child: TextField(
        controller: controller,
        decoration: _inputdec(text),
        keyboardType: type,
      ),
    );
  }

  InputDecoration _inputdec(String hintText) {
    return InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide(width: 5)));
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.smallPaddingBottom,
    UserInfosModel? model,
  }) : _model = model;

  final EdgeInsets smallPaddingBottom;
  final UserInfosModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: smallPaddingBottom,
      child: ListTile(
          title: Text(_model?.title ?? ""),
          subtitle: Text(
            _model?.body ?? "",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Text("${_model?.userId}")),
    );
  }
}

class CustomPadding {
  final EdgeInsets smallPaddingAll = const EdgeInsets.all(10);
  final EdgeInsets smallPaddingBottom = const EdgeInsets.only(bottom: 20);
}
