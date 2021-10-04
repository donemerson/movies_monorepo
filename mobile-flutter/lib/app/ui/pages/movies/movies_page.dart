import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../domain/domain.dart';
import '../../../resources/resources.dart';
import 'components/components.dart';
import 'movies_presenter.dart';

class MoviesPage extends StatefulWidget {
  final MoviesPresenter presenter;
  const MoviesPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    widget.presenter.index();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  MoviesPresenter get presenter => widget.presenter;
  List<MovieEntity> get movies => presenter.movies;
  UIState get state => presenter.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Observer(
        builder: (_) {
          switch (state) {
            case UIState.error:
              return Center(
                  child: CircularProgressIndicator(color: Colors.red));

            case UIState.loading:
              return Center(child: CircularProgressIndicator());

            case UIState.done:
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  final url = movies[index].poster;
                  final file =
                      presenter.networkCacheClient.getFileFromNetworkUrl(url);
                  return CardMovieComponent(
                    image: file,
                    entity: movies[index],
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/movieDetails', arguments: movies[index]);
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}
