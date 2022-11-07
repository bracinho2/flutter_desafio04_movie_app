import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';

import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:cambona/widgets/back_button_widget.dart';
import 'package:cambona/widgets/story_line_widget.dart';
import 'package:peabiru/peabiru.dart';

class MoviesPageDetails extends StatefulWidget {
  final MovieEntity movie;
  const MoviesPageDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MoviesPageDetails> createState() => _MoviesPageDetailsState();
}

class _MoviesPageDetailsState extends State<MoviesPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
              URLS.REQUEST_IMG(widget.movie.imagePath),
            ),
          ),
        ),
        child: Stack(
          children: [
            BackButtonWidget(
              onTap: () {
                Modular.to.pop(context);
              },
            ),
            StoryLineWidget(
              name: widget.movie.name,
              releaseDate: widget.movie.releaseDate,
              overview: widget.movie.overview,
            ),
          ],
        ),
      ),
    );
  }
}
