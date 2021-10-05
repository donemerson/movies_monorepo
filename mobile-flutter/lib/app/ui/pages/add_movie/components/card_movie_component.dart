import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/resources/resources.dart';

import '../../../ui.dart';

class CardMovieComponent extends StatelessWidget {
  final Future<File?> image;
  final OMDbEntity entity;
  final VoidCallback onTap;
  const CardMovieComponent({
    Key? key,
    required this.image,
    required this.entity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 60,
          height: 100,
          child: ImageFile(
            image,
            placeholderBuilder: (context) {
              return CircularProgressIndicator();
            },
          ),
        ),
        title: Text(entity.title),
        subtitle: Text(entity.actors),
        trailing: SizedBox(
          width: 60,
          height: 60,
          child: InkWell(
            onTap: onTap,
            child: Icon(
              Icons.add,
              size: 60,
              color: MyColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}
