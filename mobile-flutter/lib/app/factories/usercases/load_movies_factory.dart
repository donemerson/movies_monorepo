import 'package:movies_flix/app/infra/http/http.dart';
import 'package:movies_flix/mocks/local_mock_load_movie.dart';

import '../factories.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';

const _offline = bool.fromEnvironment('offline');

LoadMovies makeRemoteLoadMovies([LocalUser? localUser]) {
  late HttpClient httpClient;

  if (_offline) {
    httpClient = HttpAdapter(
      LocalMockLoadMovie.httpClient,
    );
  } else {
    if (localUser == null) {
      httpClient = makeHttpClient();
    } else {
      final future = localUser.load().then((value) =>
          <String, String>{'Authorization': 'Bearer ${value?.token}'});
      httpClient = makeHttpClient(future);
    }
  }

  return RemoteLoadMovies(
    httpClient: httpClient,
    url: makeApiUrl(''),
  );
}
