import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/theme.dart';
import '../../main.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit()
      : super(
          App.mainSharedPreferences!.getInt('selectedThemeIndex') == 2
              ? ThemeAutoState()
              : App.mainSharedPreferences!.getInt('selectedThemeIndex') == 0
                  ? ThemeLightState()
                  : ThemeDarkState(),
        );

  AppTheme getAppTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (App.mainSharedPreferences!.getInt('selectedThemeIndex') == 2) {
      if (brightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return myThemes[0];
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return myThemes[1];
      }
    }
    return myThemes[App.mainSharedPreferences!.getInt('selectedThemeIndex')!];
  }

  int getTheme() {
    return App.mainSharedPreferences!.getInt('selectedThemeIndex')!;
  }

  void setThemeMode(int mode) {
    switch (mode) {
      case 0:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        emit(ThemeLightState());
        break;
      case 1:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        emit(ThemeDarkState());
        break;
      case 2:
        emit(ThemeAutoState());
        break;
    }
    App.mainSharedPreferences!.setInt('selectedThemeIndex', mode);
  }
}
