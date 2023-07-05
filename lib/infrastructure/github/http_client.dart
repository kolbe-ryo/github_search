import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../domain/exceptions.dart';
import '../../util/logger.dart';

class GitHubHttpClient {
  const GitHubHttpClient({
    required this.token,
    required this.client,
  });

  /// アクセストークン
  final String token;

  /// HTTPクライアント
  final http.Client client;

  /// 共通ヘッダを返す
  Map<String, String> get _headers => <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $token',
      };

  /// GET Request
  Future<T> get<T>({
    required Uri uri,
    // 詰め替えはHttpClientの責務ではないため、使用先で詰め替えを担当する
    required T Function(Map<String, dynamic> data) responseBuilder,
  }) async {
    try {
      logger.i('Get request: uri = $uri');
      final response = await client.get(uri, headers: _headers);
      logger.i(
        'Get response: code = ${response.statusCode}, '
        'length = ${response.contentLength}',
      );
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body) as Map<String, dynamic>;
          return responseBuilder(data);
        case 400:
          throw NetworkException.badRequest();
        case 401:
          throw NetworkException.badCredentials();
        case 403:
          throw NetworkException.maximumNumberOfLoginAttemptsExceeded();
        case 404:
          throw NetworkException.notFound();
        case 422:
          throw NetworkException.validationFailed();
        case 503:
          throw NetworkException.serviceUnavailable();
        default:
          throw NetworkException.unknown();
      }
    } on SocketException catch (e) {
      logger.w(e);
      throw NetworkException.noInternetConnection();
    }
  }

  /// GET Raw Request for README.md
  Future<String> getRaw({
    required Uri uri,
  }) async {
    try {
      logger.i('Get raw request: uri = $uri');
      final response = await client.get(uri);
      logger.i(
        'Get raw response: code = ${response.statusCode}, '
        'length = ${response.contentLength}',
      );
      switch (response.statusCode) {
        case 200:
          return response.body;
        case 400:
          throw NetworkException.badRequest();
        case 404:
          throw NetworkException.notFound();
        case 503:
          throw NetworkException.serviceUnavailable();
        default:
          throw NetworkException.unknown();
      }
    } on SocketException catch (e) {
      logger.w(e);
      throw NetworkException.noInternetConnection();
    }
  }
}
