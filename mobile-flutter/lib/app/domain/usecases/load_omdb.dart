import 'package:movies_flix/app/domain/entities/omdb_entity.dart';

abstract class LoadOMDb {
  Future<List<OMDbEntity>> searchByTtitleYear(String title, String year);
  Future<OMDbEntity> searchById(String id);
}
