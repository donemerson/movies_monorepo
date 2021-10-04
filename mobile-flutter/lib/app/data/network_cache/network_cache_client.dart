import 'dart:io';

abstract class NetworkCacheClient {
  Future<File?> getFileFromNetworkUrl(String url);
}
