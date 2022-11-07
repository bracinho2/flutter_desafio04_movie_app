import 'package:cambona/responsivity/responsivity.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function() onTap;
  const BackButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(
            left: Responsivity.automatic(20, mediaQueryData),
            top: Responsivity.automatic(20, mediaQueryData),
          ),
          child: Container(
            height: Responsivity.automatic(30, mediaQueryData),
            width: Responsivity.automatic(30, mediaQueryData),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: Responsivity.automatic(15, mediaQueryData),
            ),
          ),
        ),
      ),
    );
  }
}
