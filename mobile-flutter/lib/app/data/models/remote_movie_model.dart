import '../../data/data.dart';

import '../../domain/domain.dart';

class RemoteMovieModel {
  final int id;
  final int userId;
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbrating;
  final String imdbvotes;
  final String imdbid;
  final String type;
  final String dvd;
  final String boxoffice;
  final String production;
  final String website;
  final bool isOwner;
  int? userRating;
  final RemoteUserModel user;
  final List<RemoteCommentModel> comment;
  final List<RemoteRatingModel> rating;

  RemoteMovieModel({
    required this.id,
    required this.isOwner,
    required this.userRating,
    required this.userId,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbrating,
    required this.imdbvotes,
    required this.imdbid,
    required this.type,
    required this.dvd,
    required this.boxoffice,
    required this.production,
    required this.website,
    required this.user,
    required this.comment,
    required this.rating,
  });
  factory RemoteMovieModel.fromJson(Map json) {
    return RemoteMovieModel(
      isOwner: json['owner'],
      id: json['id'],
      userId: json['user_id'],
      title: json['title'] ?? '',
      year: json['year'] ?? '',
      rated: json['rated'] ?? '',
      released: json['released'] ?? '',
      runtime: json['runtime'] ?? '',
      genre: json['genre'] ?? '',
      director: json['director'] ?? '',
      writer: json['writer'] ?? '',
      actors: json['actors'] ?? '',
      plot: json['plot'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
      awards: json['awards'] ?? '',
      poster: json['poster'] ?? '',
      metascore: json['metascore'] ?? '',
      imdbrating: json['imdbrating'] ?? '',
      imdbvotes: json['imdbvotes'] ?? '',
      imdbid: json['imdbid'] ?? '',
      type: json['type'] ?? '',
      dvd: json['dvd'] ?? '',
      boxoffice: json['boxoffice'] ?? '',
      production: json['production'] ?? '',
      website: json['website'] ?? '',
      userRating: json['userRating'],
      user: RemoteUserModel.fromJson(json['user']),
      comment: List.generate(
        json['comment'].length,
        (index) => RemoteCommentModel.fromJson(json['comment'][index]),
      ),
      rating: List.generate(
        json['rating'].length,
        (index) => RemoteRatingModel.fromJson(json['rating'][index]),
      ),
    );
  }

  MovieEntity toEntity() {
    double avgRating = 0.0;

    if (rating.isNotEmpty) {
      if (rating.length == 1) {
        avgRating = rating.first.value.toDouble();
      } else {
        avgRating =
            rating.map((e) => e.value).reduce((a, b) => a + b) / rating.length;
      }
    }

    return MovieEntity(
        id: this.id,
        isOwner: this.isOwner,
        userRating: this.userRating,
        userId: this.userId,
        title: this.title,
        year: this.year,
        rated: this.rated,
        released: this.released,
        runtime: this.runtime,
        genre: this.genre,
        director: this.director,
        writer: this.writer,
        actors: this.actors,
        plot: this.plot,
        language: this.language,
        country: this.country,
        awards: this.awards,
        poster: this.poster,
        metascore: this.metascore,
        imdbrating: this.imdbrating,
        imdbvotes: this.imdbvotes,
        imdbid: this.imdbid,
        type: this.type,
        dvd: this.dvd,
        boxoffice: this.boxoffice,
        production: this.production,
        website: this.website,
        user: this.user.toEntity(),
        comment: this.comment.map((e) => e.toEntity()).toList(),
        rating: this.rating.map((e) => e.toEntity()).toList(),
        avgRating: avgRating.toInt());
  }

  factory RemoteMovieModel.fromEntity(MovieEntity entity) => RemoteMovieModel(
        id: entity.id,
        userRating: entity.userRating,
        isOwner: entity.isOwner,
        userId: entity.userId,
        title: entity.title,
        year: entity.year,
        rated: entity.rated,
        released: entity.released,
        runtime: entity.runtime,
        genre: entity.genre,
        director: entity.director,
        writer: entity.writer,
        actors: entity.actors,
        plot: entity.plot,
        language: entity.language,
        country: entity.country,
        awards: entity.awards,
        poster: entity.poster,
        metascore: entity.metascore,
        imdbrating: entity.imdbrating,
        imdbvotes: entity.imdbvotes,
        imdbid: entity.imdbid,
        type: entity.type,
        dvd: entity.dvd,
        boxoffice: entity.boxoffice,
        production: entity.production,
        website: entity.website,
        user: RemoteUserModel.fromEntity(entity.user),
        comment: entity.comment
            .map((e) => RemoteCommentModel.fromEntity(e))
            .toList(),
        rating:
            entity.rating.map((e) => RemoteRatingModel.fromEntity(e)).toList(),
      );

  Map toJson() {
    return {
      'id': this.id,
      'user_id': this.userId,
      'title': this.title,
      'year': this.year,
      'rated': this.rated,
      'released': this.released,
      'runtime': this.runtime,
      'genre': this.genre,
      'director': this.director,
      'owner': this.isOwner,
      'writer': this.writer,
      'actors': this.actors,
      'plot': this.plot,
      'language': this.language,
      'country': this.country,
      'awards': this.awards,
      'poster': this.poster,
      'metascore': this.metascore,
      'imdbrating': this.imdbrating,
      'imdbvotes': this.imdbvotes,
      'imdbid': this.imdbid,
      'type': this.type,
      'dvd': this.dvd,
      'boxoffice': this.boxoffice,
      'production': this.production,
      'website': this.website,
      'userRating': this.userRating,
      'user': this.user.toJson(),
      'comment': this.comment.map((e) => e.toJson()).toList(),
      'rating': this.rating.map((e) => e.toJson()).toList(),
    };
  }
}
