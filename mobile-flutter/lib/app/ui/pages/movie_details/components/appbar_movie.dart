import 'dart:io';

import 'package:flutter/material.dart';

import '../../../ui.dart';

class AppbarMovieComponent extends StatelessWidget {
  final Future<File?> image;

  final VoidCallback onBack;
  const AppbarMovieComponent({
    Key? key,
    required this.image,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: _screenSize.width,
          height: 200,
          child: ImageFile(
            image,
            boxfit: BoxFit.fitWidth,
            placeholderBuilder: (context) {
              return CircularProgressIndicator();
            },
          ),
        ),
        InkWell(
          onTap: onBack,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: Icon(
              Icons.close,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
