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
        top: Responsivity.automatic(32, mediaQueryData),
        bottom: Responsivity.automatic(24, mediaQueryData),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
