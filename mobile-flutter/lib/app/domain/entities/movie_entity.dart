import 'entities.dart';

class MovieEntity {
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
  final UserEntity user;
  final int avgRating;
  final List<CommentEntity> comment;
  final List<RatingEntity> rating;

  MovieEntity({
    required this.id,
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
    required this.avgRating,
  });
}
