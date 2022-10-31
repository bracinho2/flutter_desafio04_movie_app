import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class AppBarMainWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsivity.automatic(20, mediaQueryData)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: Responsivity.automatic(24, mediaQueryData),
          ),
          Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.labelMedium,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
          Icon(
            Icons.menu_open,
            size: Responsivity.automatic(24, mediaQueryData),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
