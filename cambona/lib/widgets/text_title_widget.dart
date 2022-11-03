import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: Responsivity.automatic(24, mediaQueryData),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: Responsivity.automatic(22, mediaQueryData),
          right: Responsivity.automatic(22, mediaQueryData),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
