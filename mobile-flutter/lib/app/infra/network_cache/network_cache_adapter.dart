import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movies_flix/app/data/data.dart';

class NetworkCacheAdapter implements NetworkCacheClient {
  Future<File?> getFileFromNetworkUrl(String url) async {
    File? file;
    try {
      file = await DefaultCacheManager().getSingleFile(url);
    } catch (e) {}
    return file;
  }
}
