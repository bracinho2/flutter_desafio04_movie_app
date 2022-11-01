import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';

import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.keyboard_return_sharp,
        ),
        onPressed: () {
          Modular.to.pop();
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              URLS.REQUEST_IMG(widget.movie.imagePath),
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black54,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.movie.name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.movie.releaseDate,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.movie.overview,
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
