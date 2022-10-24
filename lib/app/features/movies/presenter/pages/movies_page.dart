import 'dart:math';

import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

final images = [
  'https://images.unsplash.com/photo-1586953484900-568ad9b360d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
  'https://images.unsplash.com/photo-1620736663824-18f7d3a79d54?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
  'https://images.unsplash.com/photo-1540558159980-df5705e37f6c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
  'https://images.unsplash.com/photo-1517057970663-5d535acb0b3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1628448433960-e9d7b306dd9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1400&q=80',
  'https://images.unsplash.com/photo-1628448433947-a0e350bba5ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1519&q=80',
];

int generateInt() {
  final value = Random().nextInt(images.length);
  print(value);

  return value;
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    generateInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      //   title: const Text('Movies App'),
      // ),
      body: Container(
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(images[generateInt()]),
          ),
        ),
      ),
    );
  }
}
