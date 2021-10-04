import 'dart:async';

import 'package:movies_flix/app/resources/my_typography.dart';
import 'package:movies_flix/app/ui/ui.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final FutureOr<void> Function() onPressed;
  final Color color;
  final String text;
  final BoxConstraints constraints;
  const RoundedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
    this.constraints = const BoxConstraints(
        minHeight: 32, minWidth: 103, maxHeight: 32, maxWidth: 103),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderRadius = BorderRadius.all(Radius.circular(50.0));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: MyShadow.s1,
        borderRadius: _borderRadius,
        border: Border.all(color: color),
      ),
      constraints: constraints,
      child: Material(
        borderRadius: _borderRadius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: _borderRadius,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: MyTypography.proximaNovaBold16.apply(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
