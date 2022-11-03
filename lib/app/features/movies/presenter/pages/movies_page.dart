import 'package:cambona/widgets/app_bar_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/widgets/categories_menu_list_widget.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/widgets/movies_menu_list_widget.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:peabiru/peabiru.dart';

class MoviesPage extends StatefulWidget {
  final MoviesStore store;
  const MoviesPage({
    super.key,
    required this.store,
  });

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    widget.store.getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainWidget(
        onChanged: (value) {
          widget.store.findMovie(filter: value);
        },
      ),
      body: ScopedBuilder<MoviesStore, Failure, List<MovieEntity>>(
        store: widget.store,
        onState: (context, movies) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextTitleWidget(
                title: 'Categories',
              ),
              const CategoriesMenuListWidget(),
              const SizedBox(
                height: 20,
              ),
              MoviesListWidget(
                state: movies,
              ),
            ],
          );
        },
      ),
    );
  }
}
