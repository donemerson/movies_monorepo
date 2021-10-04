import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/infra/http/http.dart';
import 'package:http/http.dart';

HttpClient makeHttpClient([Future<Map<String, String>>? headers]) {
  return HttpAdapter(Client(), headers);
}
