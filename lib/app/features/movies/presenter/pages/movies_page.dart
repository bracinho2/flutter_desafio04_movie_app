import 'package:cambona/widgets/app_bar_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/api/api_paths.dart';
import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/pages/movies_page_details.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

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
          onState: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextTitleWidget(
                  title: 'Categories',
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyCategoryList.length,
                    itemBuilder: ((context, index) {
                      final categoryName = dummyCategoryList[index]['name'];
                      bool selectedCategory =
                          toBoolean(dummyCategoryList[index]['selected']!);

                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedCategory == true
                                ? Colors.blue
                                : Colors.black12,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                categoryName!,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemCount: state.length,
                      itemBuilder: ((context, index) {
                        final title = state[index].name;
                        final accent = state[index].accent;
                        final popularidade = state[index].popularity;
                        final imagePath = state[index].imagePath;
                        return InkWell(
                          onTap: () {
                            Modular.to.pushNamed(
                              '/movies/details/',
                              arguments: state[index],
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 140,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  URLS.REQUEST_IMG(imagePath)),
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                          ),
                                          width: 116,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Language: ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                  TextSpan(
                                                    text: accent,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Popularity: ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        popularidade.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      height: 32,
                                      width: 50,
                                      child: Center(
                                        child: Text(
                                          state[index].evaluation.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
