import 'package:cambona/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/snake_bar_manager/snake_bar_manager.dart';
import 'package:peabiru/peabiru.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: SnakeBarManager.snakebarKey,
      theme: appTheme,
      title: 'Movies APP',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
