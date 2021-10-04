import 'package:movies_flix/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/pages/pages.dart';
import 'movies_presenter_factory.dart';

Widget makeMoviesPage(NetworkCacheClient networkCacheClient) => Provider(
      create: (_) => makeStoreMoviesPresenter(networkCacheClient),
      child: Builder(
        builder: (context) => MoviesPage(
          presenter: Provider.of<MoviesPresenter>(context),
        ),
      ),
    );
