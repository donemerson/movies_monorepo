import 'package:movies_flix/app/domain/domain.dart';
import 'package:movies_flix/app/domain/entities/omdb_entity.dart';

import '../../data.dart';

const _URL = 'http://www.omdbapi.com/';
const _OMDB_KEY = String.fromEnvironment('omdb_key');

class RemoteLoadOMDb implements LoadOMDb {
  final HttpClient httpClient;

  RemoteLoadOMDb(this.httpClient);

  @override
  Future<List<OMDbEntity>> searchByTtitleYear(String title, String year) async {
    final lista = <OMDbEntity>[];
    try {
      dynamic json =
          await httpClient.request(url: _URL, method: 'get', queryParams: {
        'apikey': _OMDB_KEY,
        'y': year,
        's': title,
      });
      if (json != null && json is Map && json.containsKey('Search')) {
        json = json['Search'];

        if (json is List) {
          json.forEach(
            (element) {
              if (element is Map) {
                final modelJson = element.map<String, dynamic>((key, value) =>
                    MapEntry<String, dynamic>(
                        '${key.toString().toLowerCase()}', value));
                final _model = RemoteOMDbModel.fromJson(modelJson);
                final _entity = _model.toEntity();
                lista.add(_entity);
              } else {
                throw DomainError.unexpected;
              }
            },
          );
        } else {
          throw DomainError.unexpected;
        }
      } else {
        throw DomainError.unexpected;
      }
    } catch (e) {
      throw DomainError.unexpected;
    }
    return lista;
  }

  Future<OMDbEntity> searchById(String id) async {
    late final OMDbEntity entity;
    try {
      dynamic json =
          await httpClient.request(url: _URL, method: 'get', queryParams: {
        'apikey': _OMDB_KEY,
        'i': id,
      });
      if (json != null && json is Map) {
        // conert Key to Lowercase
        json = json.map<String, dynamic>((key, value) =>
            MapEntry<String, dynamic>(
                '${key.toString().toLowerCase()}', value));

        final _model = RemoteOMDbModel.fromJson(json);
        entity = _model.toEntity();
      } else {
        throw DomainError.unexpected;
      }
    } catch (e) {
      throw DomainError.unexpected;
    }
    return entity;
  }
}
