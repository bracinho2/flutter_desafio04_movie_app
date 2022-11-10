import 'package:cambona/widgets/app_bar_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/state/movies_state_page.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/widgets/categories_menu_list_widget.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/widgets/movies_menu_list_widget.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store_state.dart';
import 'package:peabiru/peabiru.dart';

class MoviesPageState extends StatefulWidget {
  final MoviesStoreState store;
  const MoviesPageState({
    super.key,
    required this.store,
  });

  @override
  State<MoviesPageState> createState() => _MoviesPageStateState();
}

class _MoviesPageStateState extends State<MoviesPageState> {
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
          widget.store.filter(value);
        },
      ),
      body: ScopedBuilder<MoviesStoreState, Failure, IMoviesState>(
        store: widget.store,
        onState: (context, state) {
          if (state is DataState) {
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
                  state: state.movies,
                ),
              ],
            );
          }
          if (state is FilteredState) {
            print('Filtered State');
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
                  state: state.filteredMovies,
                ),
              ],
            );
          }
          return const Text('');
        },
      ),
    );
  }
}
