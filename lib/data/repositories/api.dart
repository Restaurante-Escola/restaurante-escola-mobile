///
/// Created by Claudio
///

import 'package:dio/dio.dart';
import 'package:restaurante_escola_app/shared/secure-store-mixin.dart';

class ApiClient {
  static Dio? _dioInstance;
  static BaseOptions? _options;
  static InterceptorsWrapper? _dioInterceptor;

  static Dio api() {
    if (_options == null) {
      _options = BaseOptions(
        baseUrl:
            'http://restauranteescolaapi-env.eba-cyze4etr.us-east-2.elasticbeanstalk.com:8080/',
        connectTimeout: 30 * 1000,
      );
    }

    _dioInstance = (_dioInstance == null ? Dio(_options) : _dioInstance);

    if (_dioInterceptor == null) {
      _dioInterceptor = AuthInterceptors();
      _dioInstance!.interceptors.add(_dioInterceptor!);
    }

    return _dioInstance!;
  }
}

class AuthInterceptors extends InterceptorsWrapper with SecureStoreMixin {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = await this.getHeaders();
    return super.onRequest(options, handler);
  }

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<Map<String, String>> getHeaders([String? contentType]) async {
    bool loggedIn = await getUserIsLoggedIn();
    if (!loggedIn) {
      return _headers;
    }

    String? token = await getAuthToken();
    if (token == null) return _headers;

    Map<String, String> headers = {'Authorization': 'Bearer ' + token};

    if (contentType == null) {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
    }

    return headers;
  }
}
