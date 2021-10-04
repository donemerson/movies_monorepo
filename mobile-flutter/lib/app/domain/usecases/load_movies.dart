import '../../domain/entities/entities.dart';

abstract class LoadMovies {
  Future<List<MovieEntity>> index(int page, int limit);
  Future<MovieEntity> show(int id);
  Future<void> store(MutationMovieEntity entity);
  Future<void> update(int id, MutationMovieEntity entity);
  Future<void> destroy(int id);
  Future<void> rating(int id, int value);
  Future<void> comment(int id, String value);
}
