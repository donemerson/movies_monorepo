import 'package:movies_flix/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:movies_flix/app/domain/domain.dart';
import 'package:provider/provider.dart';

import '../../../ui/pages/pages.dart';
import 'movie_details_presenter_factory.dart';

Widget makeMovieDetailsPage(
        NetworkCacheClient networkCacheClient, MovieEntity movieEntity) =>
    Provider(
      create: (_) => makeStoreMovieDetailsPresenter(
        networkCacheClient,
        movieEntity,
      ),
      child: Builder(
        builder: (context) => MovieDetailsPage(
          presenter: Provider.of<MovieDetailsPresenter>(context),
        ),
      ),
    );
