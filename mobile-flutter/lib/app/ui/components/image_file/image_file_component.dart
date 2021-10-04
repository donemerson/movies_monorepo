import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ImageFile extends StatelessWidget {
  final Future<File?> image;
  final int? cacheWidth;
  final int? cacheHeight;
  final Widget Function(BuildContext context) placeholderBuilder;
  const ImageFile(
    this.image, {
    Key? key,
    required this.placeholderBuilder,
    this.cacheWidth,
    this.cacheHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
        future: image,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final _file = snapshot.data;
            if (_file != null) {
              return Image.file(
                _file,
                cacheHeight: cacheHeight,
                cacheWidth: cacheWidth,
              );
            } else {
              return Center(
                child: placeholderBuilder(context),
              );
            }
          } else {
            return Center(
              child: placeholderBuilder(context),
            );
          }
        });
  }
}
