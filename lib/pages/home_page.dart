
import 'package:dark_light_theme_with_cubit/cubit/theme/change_theme_cubit.dart';
import 'package:dark_light_theme_with_cubit/pages/widgets/theme_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/theme_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ThemeModel>? _themeModels;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _themeModels = <ThemeModel>[
          ThemeModel(
            "Light Mode",
            Icons.wb_sunny,
            false,
          ),
          ThemeModel(
            "Dark Mode",
            Icons.tonality_outlined,
            false,
          ),
          ThemeModel("Auto", Icons.brightness_auto, false)
        ];

        _themeModels![context.read<ChangeThemeCubit>().getTheme()].isSelected =
        true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,

      body: Stack(
        alignment: Alignment.bottomCenter,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Theme',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _theme.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: _themeModels != null
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            context
                                .read<ChangeThemeCubit>()
                                .setThemeMode(0);
                            _themeModels![0].isSelected = true;
                            _themeModels![1].isSelected = false;
                            _themeModels![2].isSelected = false;
                          });
                        },
                        child: ThemeRadio(_themeModels![0]),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            context
                                .read<ChangeThemeCubit>()
                                .setThemeMode(1);
                            _themeModels![0].isSelected = false;
                            _themeModels![1].isSelected = true;
                            _themeModels![2].isSelected = false;
                          });
                        },
                        child: ThemeRadio(_themeModels![1]),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            context
                                .read<ChangeThemeCubit>()
                                .setThemeMode(2);
                            _themeModels![0].isSelected = false;
                            _themeModels![1].isSelected = false;
                            _themeModels![2].isSelected = true;
                          });
                        },
                        child: ThemeRadio(_themeModels![2]),
                      )
                    ],
                  )
                      : Container(),
                )
              ],
            ),
          ),


          Positioned(
            top: 35,
            left: 0,

            child: BackButton(color: _theme.accentColor),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}