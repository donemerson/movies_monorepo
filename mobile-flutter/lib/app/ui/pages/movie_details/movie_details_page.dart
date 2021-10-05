import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../domain/domain.dart';
import '../../../resources/resources.dart';
import 'components/components.dart';
import 'movie_details_presenter.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsPresenter presenter;
  const MovieDetailsPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    widget.presenter.dispose();
    super.dispose();
  }

  MovieDetailsPresenter get presenter => widget.presenter;
  MovieEntity get entity => presenter.entity;
  Map<String, Widget> get entityValues => {
        'id': generateListTile(title('id'), subtitle(entity.id.toString())),
        'title': generateListTile(
          title('title'),
          subtitle(entity.title),
        ),
        'year': generateListTile(
          title('year'),
          subtitle(entity.year),
        ),
        'rated': generateListTile(
          title('rated'),
          subtitle(entity.rated),
        ),
        'released': generateListTile(
          title('released'),
          subtitle(entity.released),
        ),
        'runtime': generateListTile(
          title('runtime'),
          subtitle(entity.runtime),
        ),
        'genre': generateListTile(
          title('genre'),
          subtitle(entity.genre),
        ),
        'director': generateListTile(
          title('director'),
          subtitle(entity.director),
        ),
        'writer': generateListTile(
          title('writer'),
          subtitle(entity.writer),
        ),
        'actors': generateListTile(
          title('actors'),
          subtitle(entity.actors),
        ),
        'plot': generateListTile(
          title('plot'),
          subtitle(entity.plot),
        ),
        'language': generateListTile(
          title('language'),
          subtitle(entity.language),
        ),
        'country': generateListTile(
          title('country'),
          subtitle(entity.country),
        ),
        'awards': generateListTile(
          title('awards'),
          subtitle(entity.awards),
        ),
        // 'poster': generateListTile(
        //   title('poster'),
        //   subtitle(entity.poster),
        // ),
        'metascore': generateListTile(
          title('metascore'),
          subtitle(entity.metascore),
        ),
        'imdbrating': generateListTile(
          title('imdbrating'),
          subtitle(entity.imdbrating),
        ),
        'imdbvotes': generateListTile(
          title('imdbvotes'),
          subtitle(entity.imdbvotes),
        ),
        'imdbid': generateListTile(
          title('imdbid'),
          subtitle(entity.imdbid),
        ),
        'type': generateListTile(
          title('type'),
          subtitle(entity.type),
        ),
        'dvd': generateListTile(
          title('dvd'),
          subtitle(entity.dvd),
        ),
        'boxoffice': generateListTile(
          title('boxoffice'),
          subtitle(entity.boxoffice),
        ),
        'production': generateListTile(
          title('production'),
          subtitle(entity.production),
        ),
        'website': generateListTile(
          title('website'),
          subtitle(entity.website),
        ),
        'avgRating': generateListTile(
          title('avgRating'),
          subtitle(entity.avgRating.toString()),
        ),
        'user': generateListTile(
          title('username'),
          subtitle(entity.user.username),
        ),
        'comment': Container(
          margin: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.divider),
            ),
            child: RichText(
              text: TextSpan(
                style: MyTypography.proximaNovaExtraBold18
                    .apply(color: MyColors.grey01),
                text: 'Comentários:',
                children: [
                  WidgetSpan(
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: commentController,
                                  decoration:
                                      InputDecoration(hintText: 'Escreva'),
                                  minLines: 1,
                                  maxLines: 2,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  presenter.comment(commentController.text);
                                },
                                child: Text("Comentar"),
                              ),
                            ],
                          ),
                        ),
                        ...entity.comment.map((e) => generateListTile(
                            title('${e.user.username} comentou:'),
                            subtitle(e.value)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      };

  Text subtitle(String value) {
    return Text(value,
        style: MyTypography.proximaNovaBold16.apply(color: MyColors.grey03));
  }

  Text title(String value) {
    return Text(value,
        style: MyTypography.proximaNovaBold16.apply(color: MyColors.grey01));
  }

  ListTile generateListTile(Text title, Text subtitle) {
    return ListTile(
      title: title,
      subtitle: subtitle,
    );
  }

  UIState get state => presenter.uiState;
  final rattingValue = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (state != UIState.done)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (rattingValue.value != entity.avgRating) {
              rattingValue.value = entity.avgRating;
            }
            final url = entity.poster;
            final file =
                presenter.networkCacheClient.getFileFromNetworkUrl(url);
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppbarMovieComponent(
                    image: file,
                    onBack: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Builder(builder: (_) {
                    return Container(
                      // margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: title('Sua avaliação: '),
                        subtitle: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...List.generate(5, (index) {
                              final ratting = (index + 1);

                              return ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    ratting == entity.userRating
                                        ? MyColors.accent
                                        : MyColors.blue1,
                                  ),
                                ),
                                onPressed: () {
                                  presenter.rate(ratting);
                                },
                                child: Text((ratting).toString()),
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
                  ...entityValues.entries.toList().map((e) => e.value)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
