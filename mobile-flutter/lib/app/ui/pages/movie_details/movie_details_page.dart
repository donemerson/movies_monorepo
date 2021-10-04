import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../domain/domain.dart';
import '../../../resources/resources.dart';
import 'movie_details_presenter.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsPresenter presenter;
  const MovieDetailsPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  MovieDetailsPresenter get presenter => widget.presenter;
  MovieEntity get entity => presenter.entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('MovieDetails'),
      ),
      body: Observer(
        builder: (_) {
          return Container();
        },
      ),
    );
  }
}
