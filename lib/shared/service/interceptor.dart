import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api extends Interceptor {

  Dio api = Dio();

  String? accessToken;

  final _storage = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    if (!options.path.contains('http')) {
      options.path = 'http://192.168.0.20:9090 $options.path';
    }

    options.headers['Authorization'] = 'Bearer $accessToken';
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    final tokenIsExpired = err.response?.statusCode == 401 && err.response?.data['message'] == 'Invalid JWT';

    if (tokenIsExpired) {
      if (await _storage.containsKey(key: 'refreshToken')) {
        await refreshToken();
      }
    }

    return super.onError(err, handler);
  }

  Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api.post('/auth/refresh', data: {'refreshToken': refreshToken});

    if (response.statusCode == 201) {
      accessToken = response.data;
    } else {
      accessToken = null;
      _storage.deleteAll();
    }
  }


}