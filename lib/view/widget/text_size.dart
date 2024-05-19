
import 'package:flutter/material.dart';

class HeadlineLargeText extends StatelessWidget {
  final String text;
  final Color color;
  const HeadlineLargeText({
    super.key, required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: color.withOpacity(.9)
    ),);
  }
}


class HeadLineMediumText extends StatelessWidget {
  final String text;
  final Color color;
  const HeadLineMediumText({
    super.key, required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: color.withOpacity(.7)
    ),);
  }
}


class HeadLineSmallText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;

   HeadLineSmallText({
    super.key, required this.text, required this.color,  this.fontsize=15,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme
        .of(context)
        .textTheme
        .headlineSmall!
        .copyWith(
        color: color.withOpacity(.7),
      fontSize: fontsize,
    ),);
  }
}