import 'package:cambona/widgets/movie_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:cambona/widgets/mini_poster_widget.dart';
import 'package:cambona/widgets/movie_info_widget.dart';
import 'package:cambona/widgets/movie_rate_widget.dart';
import 'package:peabiru/peabiru.dart';

class MoviesListWidget extends StatelessWidget {
  final List<MovieEntity> state;
  const MoviesListWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
              stops: [0.0, 0.1, 0.9, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.builder(
            clipBehavior: Clip.antiAlias,
            itemCount: state.length,
            itemBuilder: ((context, index) {
              final title = state[index].name;
              final language = state[index].language;
              final popularity = state[index].popularity.toString();
              final imagePath = state[index].imagePath;
              final evaluation = state[index].evaluation.toString();
              return MovieListItemWidget(
                title: title,
                language: language,
                popularity: popularity,
                evaluation: evaluation,
                imagePath: URLS.REQUEST_IMG(imagePath),
                onTap: () {
                  Modular.to.pushNamed(
                    '/movies/details/',
                    arguments: state[index],
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
