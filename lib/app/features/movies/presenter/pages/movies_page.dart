import 'dart:math';

import 'package:cambona/responsivity/responsivity.dart';
import 'package:cambona/widgets/app_bar_widget.dart';
import 'package:cambona/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/core/errors/errors.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/category_movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/presenter/store/movies_store.dart';
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
      appBar: const AppBarMainWidget(),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: ((context, index) {
                      final title = state[index].name;
                      final accent = state[index].accent;
                      final level = state[index].level.name;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          height: 140,
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
                                              state[index].imagePath),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      width: 116,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Accent: $accent',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        Text(
                                          accent,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                          'Level: $level',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
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
                                          state[index].evaluation.toString())),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.heart_broken,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Scaffold01 extends StatelessWidget {
  const Scaffold01({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 85,
              flexibleSpace: AppBarMainWidget(),
            ),
            SliverToBoxAdapter(
              child: TextTitleWidget(title: 'Categories'),
            ),
            CategoryFilterWidget(),
            MoviesLiss(),
          ],
        ),
      ),
    );
  }
}

class MoviesLiss extends StatelessWidget {
  const MoviesLiss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          color: Colors.amber,
          height: 50,
        ),
        childCount: 50,
      ),
    );
  }
}

class CategoryFilterWidget extends StatelessWidget {
  const CategoryFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Responsivity.automatic(30, mediaQueryData),
        child: Padding(
          padding:
              EdgeInsets.only(left: Responsivity.automatic(10, mediaQueryData)),
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: ((context, index) => CustomHorizontalMenuItem(
                  clicked: filterMenuItemList[index].selected,
                  name: filterMenuItemList[index].name,
                )),
          ),
        ),
      ),
    );
  }
}

class CustomHorizontalMenuItem extends StatelessWidget {
  final bool clicked;
  final String name;

  const CustomHorizontalMenuItem({
    Key? key,
    required this.clicked,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(left: Responsivity.automatic(8, mediaQueryData)),
      child: Container(
        padding: EdgeInsets.only(
            left: Responsivity.automatic(12, mediaQueryData),
            right: Responsivity.automatic(12, mediaQueryData)),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Responsivity.automatic(20, mediaQueryData)),
          color: clicked ? Colors.blue[800] : Colors.black26,
        ),
        child: Row(
          children: [
            if (name.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  left: Responsivity.automatic(8, mediaQueryData),
                  right: Responsivity.automatic(8, mediaQueryData),
                ),
                child: Text(
                  name,
                ),
              )
          ],
        ),
      ),
    );
  }
}

List<CategoryEntity> filterMenuItemList = [
  CategoryEntity(id: 01, name: 'All', selected: true),
  CategoryEntity(id: 02, name: 'Series', selected: false),
  CategoryEntity(id: 03, name: 'Movies', selected: true),
  CategoryEntity(id: 04, name: 'Animation', selected: false),
  CategoryEntity(id: 01, name: 'All', selected: true),
  CategoryEntity(id: 02, name: 'Series', selected: false),
  CategoryEntity(id: 03, name: 'Movies', selected: true),
  CategoryEntity(id: 04, name: 'Animation', selected: false),
];
