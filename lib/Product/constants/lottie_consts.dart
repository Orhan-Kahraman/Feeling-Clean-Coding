enum LottieItems { themeChange, darkLightTheme }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return "theme_switch";
      case LottieItems.darkLightTheme:
        return "dark_light_themes";
    }
  }

  String get lottiePath => "assets/lottie_items/${_path()}.json";
}
