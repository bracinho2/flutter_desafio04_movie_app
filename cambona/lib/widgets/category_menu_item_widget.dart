import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class CategoryMenuItemWidget extends StatelessWidget {
  final String name;
  final bool selected;
  const CategoryMenuItemWidget({
    Key? key,
    required this.name,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: selected == true ? Colors.blue : Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(Responsivity.automatic(22, mediaQueryData)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(Responsivity.automatic(10, mediaQueryData)),
        child: Center(
          child: Text(
            name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
