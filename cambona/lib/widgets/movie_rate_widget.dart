import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class MovieRateWidget extends StatelessWidget {
  final String evaluation;
  const MovieRateWidget({
    Key? key,
    required this.evaluation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(Responsivity.automatic(10, mediaQueryData)),
          child: const Icon(
            Icons.favorite,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(Responsivity.automatic(10, mediaQueryData)),
              bottomRight:
                  Radius.circular(Responsivity.automatic(10, mediaQueryData)),
            ),
          ),
          height: Responsivity.automatic(32, mediaQueryData),
          width: Responsivity.automatic(50, mediaQueryData),
          child: Center(
            child: Text(
              evaluation,
            ),
          ),
        ),
      ],
    );
  }
}
