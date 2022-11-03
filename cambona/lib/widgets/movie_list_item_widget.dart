import 'package:cambona/responsivity/responsivity.dart';
import 'package:cambona/widgets/mini_poster_widget.dart';
import 'package:cambona/widgets/movie_info_widget.dart';
import 'package:cambona/widgets/movie_rate_widget.dart';
import 'package:flutter/material.dart';

class MovieListItemWidget extends StatelessWidget {
  final void Function() onTap;
  final String imagePath;
  final String title;
  final String language;
  final String popularity;
  final String evaluation;
  const MovieListItemWidget({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.title,
    required this.language,
    required this.popularity,
    required this.evaluation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(
          Responsivity.automatic(10, mediaQueryData),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(
                Responsivity.automatic(
                  10,
                  mediaQueryData,
                ),
              ),
            ),
          ),
          height: Responsivity.automatic(140, mediaQueryData),
          width: double.infinity,
          child: Stack(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: MiniPosterWidget(
                      imagePath: imagePath,
                    ),
                  ),
                  Flexible(
                    child: MovieInfoWidget(
                      title: title,
                      language: language,
                      popularity: popularity,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MovieRateWidget(
                  evaluation: evaluation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
