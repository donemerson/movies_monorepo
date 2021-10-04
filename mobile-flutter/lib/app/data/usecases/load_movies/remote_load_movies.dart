import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RemoteLoadMovies implements LoadMovies {
  final HttpClient httpClient;
  final String url;

  RemoteLoadMovies({required this.httpClient, required this.url});

  @override
  Future<void> comment(int id, String value) async {
    await httpClient.request(url: url + 'comment', method: 'post', body: {
      'movie_id': id,
      'value': value,
    });
  }

  @override
  Future<void> rating(int id, int value) async {
    await httpClient.request(url: url + 'rating', method: 'post', body: {
      'movie_id': id,
      'value': value,
    });
  }

  @override
  Future<void> destroy(int id) async {
    await httpClient.request(url: url + 'movie/$id', method: 'delete');
  }

  @override
  Future<List<MovieEntity>> index(int page, int limit) async {
    final lista = <MovieEntity>[];
    try {
      final response =
          await httpClient.request(url: url + 'movie', method: 'get');
      if (response != null && response is Map) {
        final data = response['data'];

        if (data != null && data is List) {
          data.forEach((e) {
            // Criando model;
            final entity = RemoteMovieModel.fromJson(e).toEntity();
            lista.add(entity);
          });
        }
      }
    } catch (e) {
      throw DomainError.unexpected;
    }
    return lista;
  }

  @override
  Future<MovieEntity> show(int id) async {
    try {
      final response =
          await httpClient.request(url: url + 'movie/$id', method: 'get');

      if (response != null && response is Map) {
        final data = response['data'];
        if (data != null && data is Map) {
          final entity = RemoteMovieModel.fromJson(data).toEntity();
          return entity;
        } else {
          throw DomainError.unexpected;
        }
      } else {
        throw DomainError.unexpected;
      }
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<void> store(MutationMovieEntity entity) async {
    try {
      await httpClient.request(
        url: url + 'movie',
        method: 'post',
        body: RemoteMutationMovieModel.fromEntity(entity).toJson(),
      );
    } catch (e) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<void> update(int id, MutationMovieEntity entity) async {
    try {
      await httpClient.request(
        url: url + 'movie/$id',
        method: 'patch',
        body: RemoteMutationMovieModel.fromEntity(entity).toJson(),
      );
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
