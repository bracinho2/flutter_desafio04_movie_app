import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/app_module.dart';
import 'package:flutter_desafio04_movie_app/app/app_widget.dart';
import 'package:peabiru/peabiru.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
