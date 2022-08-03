import 'package:dark_light_theme_with_cubit/cubit/theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  App.mainSharedPreferences = await SharedPreferences.getInstance();
  final themeIndex = App.mainSharedPreferences!.getInt('selectedThemeIndex');
  if (themeIndex == null) {
    await App.mainSharedPreferences!.setInt('selectedThemeIndex', 2);
  }

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static SharedPreferences? mainSharedPreferences;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

