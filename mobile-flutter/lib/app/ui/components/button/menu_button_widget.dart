import 'package:movies_flix/app/resources/my_color.dart';
import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const MenuButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 24,
        maxHeight: 24,
        minWidth: 24,
        maxWidth: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Flexible(child: _Ball()),
          Flexible(child: _Ball()),
          Flexible(child: _Ball()),
        ],
      ),
    );
  }
}

class _Ball extends StatelessWidget {
  const _Ball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: MyColors.sombra2,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
