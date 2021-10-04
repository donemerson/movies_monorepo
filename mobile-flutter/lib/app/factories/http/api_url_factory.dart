const _endpoint =
    String.fromEnvironment('endpont', defaultValue: 'http://localhost:3333');
String makeApiUrl(String path) => '$_endpoint/$path';
