import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class MiniPosterWidget extends StatelessWidget {
  final String imagePath;
  const MiniPosterWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagePath),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Responsivity.automatic(10, mediaQueryData)),
          bottomLeft:
              Radius.circular(Responsivity.automatic(10, mediaQueryData)),
        ),
      ),
      width: 116,
    );
  }
}
