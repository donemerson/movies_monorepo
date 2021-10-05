import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../domain/domain.dart';
import '../../../resources/resources.dart';
import 'components/components.dart';
import 'add_movie_presenter.dart';

class AddMoviePage extends StatefulWidget {
  final AddMoviePresenter presenter;
  const AddMoviePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController yearCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    yearCtrl.dispose();
    titleCtrl.dispose();
    super.dispose();
  }

  AddMoviePresenter get presenter => widget.presenter;
  List<OMDbEntity> get movies => presenter.movies;
  UIState get state => presenter.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text(
          R.string.msgAppbarAddMovies,
          style: MyTypography.proximaNovaBold16.apply(color: MyColors.accent),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(hintText: 'Title'),
                  controller: titleCtrl),
              TextFormField(
                decoration: InputDecoration(hintText: 'Year'),
                controller: yearCtrl,
              ),
              ElevatedButton(
                  onPressed: () {
                    presenter.search(titleCtrl.text, yearCtrl.text);
                  },
                  child: Text("Search")),
              Expanded(
                child: state != UIState.done
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (_, index) {
                          final url = movies[index].poster;
                          final file = presenter.networkCacheClient
                              .getFileFromNetworkUrl(url);
                          return CardMovieComponent(
                            image: file,
                            entity: movies[index],
                            onTap: () {
                              presenter.add(movies[index].imdbid);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
