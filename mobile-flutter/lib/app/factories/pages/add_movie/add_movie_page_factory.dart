import 'package:movies_flix/app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../ui/pages/pages.dart';
import 'add_movie_presenter_factory.dart';

Widget makeAddMoviePage(NetworkCacheClient networkCacheClient) => Provider(
      create: (_) => makeStoreAddMoviePresenter(
        networkCacheClient,
      ),
      child: Builder(
        builder: (context) => AddMoviePage(
          presenter: Provider.of<AddMoviePresenter>(context),
        ),
      ),
    );
