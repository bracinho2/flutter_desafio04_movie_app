import 'package:flutter/material.dart';
import 'package:cambona/widgets/category_menu_item_widget.dart';
import 'package:flutter_desafio04_movie_app/app/core/dummy_data/dummy_data.dart';
import 'package:flutter_desafio04_movie_app/app/features/movies/infra/mappers/movie_mappers.dart';

class CategoriesMenuListWidget extends StatelessWidget {
  const CategoriesMenuListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        clipBehavior: Clip.hardEdge,
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategoryList.length,
        itemBuilder: ((context, index) {
          final name = dummyCategoryList[index]['name'];
          bool selected = toBoolean(dummyCategoryList[index]['selected']!);

          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CategoryMenuItemWidget(
              name: name!,
              selected: selected,
            ),
          );
        }),
      ),
    );
  }
}
