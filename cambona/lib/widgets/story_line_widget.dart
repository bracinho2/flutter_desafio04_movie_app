import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class StoryLineWidget extends StatelessWidget {
  final String name;
  final String releaseDate;
  final String overview;
  const StoryLineWidget({
    Key? key,
    required this.name,
    required this.releaseDate,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Responsivity.automatic(400, mediaQueryData),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft:
                Radius.circular(Responsivity.automatic(40, mediaQueryData)),
            topRight:
                Radius.circular(Responsivity.automatic(40, mediaQueryData)),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              releaseDate,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Responsivity.automatic(22, mediaQueryData),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Story Line',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: Responsivity.automatic(22, mediaQueryData),
                  ),
                  Text(
                    overview,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
