import 'package:flutter/material.dart';
import 'constants.dart';
class BmiContainer extends StatelessWidget {
  const BmiContainer({super.key, required this.content, required this.isColored});

  final bool isColored;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: isColored ? Constants().primary : Constants().secondary,
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fill,
            child: content,
          ),
        ),
      ),
    );
  }
}