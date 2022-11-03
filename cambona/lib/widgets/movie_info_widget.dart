import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class MovieInfoWidget extends StatelessWidget {
  final String title;
  final String language;
  final String popularity;
  const MovieInfoWidget({
    Key? key,
    required this.title,
    required this.language,
    required this.popularity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding:
          EdgeInsets.only(left: Responsivity.automatic(30, mediaQueryData)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: Responsivity.automatic(10, mediaQueryData),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Language: ',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextSpan(
                  text: language,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Responsivity.automatic(5, mediaQueryData),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Popularity: ',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextSpan(
                  text: popularity,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
