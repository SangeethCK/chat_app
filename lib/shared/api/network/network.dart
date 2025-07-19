import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/shared/app/helper.dart';
import 'package:chat_app/shared/constant/base_url.dart';
import 'package:chat_app/shared/utilities/auth/auth_utils.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class NetworkProvider {
  final Dio _dio;
  static final Map<String, Response> _cache = {};

  NetworkProvider()
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        logPrint: print,
        retries: 3,
        retryEvaluator: (error, attempt) {
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401 ||
              (error.response?.statusCode == 400)) {
            return false;
          }
          return true;
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log(
            '------------------------------------------------------------------------------------------------',
          );
          String fullUrl = baseUrl + options.path;
          log('Full URL: $fullUrl');
          if (options.contentType == 'multipart/form-data') {
            log('Request = ${options.data}', name: options.path);
          } else {
            log('Request = ${jsonEncode(options.data)}', name: options.path);
          }
          log(
            '------------------------------------------------------------------------------------------------',
          );

          if (options.headers.containsKey('auth')) {
            options.headers.remove('auth');
          } else {
            final String? token = await AuthUtils.instance.readAccessToken;

            log("Access token  $token");
            if (token != null && token != "") {
              options.headers.addEntries(
                {'Authorization': 'Bearer $token'}.entries,
              );
            }

            log("token $token");
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          log(
            '************************************************************************************************',
          );
          log(
            'Response = ${response.data.toString()}',
            name: response.requestOptions.path,
          );
          log(
            '************************************************************************************************',
          );

          return handler.next(response);
        },
        onError: (error, handler) async {
          log(
            'Error [${error.response?.statusCode}] => ${error.response?.data}',
          );
          if (error.response?.statusCode == 401) {
            final newToken = await AuthUtils.instance.readAccessToken;
            if (newToken != null) {
              final options = error.requestOptions;
              options.headers['Authorization'] = 'Bearer $newToken';
              return handler.resolve(await _dio.fetch(options));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response<T>> _makeRequest<T>(
    String method,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool force = false,
  }) async {
    final cacheKey = _generateCacheKey(
      method,
      path,
      data ?? queryParameters ?? {},
    );

    if (_cache.containsKey(cacheKey) && force && method == 'GET') {
      return _cache[cacheKey]! as Response<T>;
    }

    try {
      Response<T> response;
      switch (method) {
        case 'GET':
          response = await _dio.get<T>(
            path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case 'POST':
          response = await _dio.post<T>(
            path,
            data: Helper().removeNullValues(data ?? {}),
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case 'PUT':
          response = await _dio.put<T>(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case 'DELETE':
          response = await _dio.delete<T>(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        case 'PATCH':
          response = await _dio.patch<T>(
            path,
            data: Helper().removeNullValues(data ?? {}),
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        _cache[cacheKey] = response;
      }

      return response;
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool force = false,
  }) async {
    return _makeRequest<T>(
      'GET',
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      force: force,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool force = false,
  }) async {
    return _makeRequest<T>(
      'POST',
      path,
      data: data ?? formData,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      force: force,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool force = false,
  }) async {
    return _makeRequest<T>(
      'PUT',
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      force: force,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool force = false,
  }) async {
    return _makeRequest<T>(
      'DELETE',
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      force: force,
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool force = false,
  }) async {
    return _makeRequest<T>(
      'PATCH',
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      force: force,
    );
  }

  Future<Response<T>> formData<T>(
    String path, {
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool force = false,
  }) async {
    return _dio.post<T>(
      path,
      data: formData,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> retryRequest<T>(RequestOptions requestOptions) async {
    final Completer<Response<T>> responseCompleter = Completer<Response<T>>();

    responseCompleter.complete(request<T>(requestOptions));

    return responseCompleter.future;
  }

  Future<Response<T>> request<T>(RequestOptions requestOptions) async {
    return _dio.request<T>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers,
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        persistentConnection: requestOptions.persistentConnection,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }

  String _generateCacheKey(
    String method,
    String url,
    Map<String, dynamic> data,
  ) {
    final methodString = method.toString();
    final dataString = jsonEncode(data);
    return '$methodString|$url|$dataString';
  }
}

dynamic errorMapping(Response? response) {
  final badRequest = <BadRequest>[]; // List to store BadRequest objects
  var errorString = ''; // String to accumulate error messages

  // Iterate over response data keys
  (response?.data.keys.forEach((key) {
    if (key == 'message' ||
        key == 'error' ||
        key == 'status' ||
        key == 'detail' ||
        key == 'email') {
      final message = <String>[];
      if (key == 'email') {
        message.add(response.data[key][0]);
      } else {
        message.add(response.data[key]);
      }
      badRequest.add(
        BadRequest(
          errorField: '',
          error: message,
        ), // Add message/error to badRequest
      );
    } else {
      badRequest.add(
        BadRequest(
          errorField: key,
          error: List<String>.from(response.data[key].map((x) => x)),
        ), // Add other errors to badRequest
      );
    }
  }));

  // Construct error string from badRequest list
  for (var element in badRequest) {
    var subString = '';
    element.error?.forEach((sub) {
      subString = '$subString\n$sub';
    });
    if (errorString.isEmpty) {
      errorString = '${replaceCharacters(element.errorField ?? '')}$subString';
    } else {
      errorString =
          '$errorString\n\n${replaceCharacters(element.errorField ?? '')}$subString';
    }
  }

  // // Show error string in a snackbar
  // log('---------------------- errorString ----------------------');
  // log(errorString);
  // log('---------------------- errorString ----------------------');
  return errorString;
}

class BadRequest {
  BadRequest({this.errorField, this.error});

  String? errorField;
  List<String>? error;

  factory BadRequest.fromRawJson(String str) =>
      BadRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BadRequest.fromJson(Map<String, dynamic> json) => BadRequest(
    errorField: json['error_field'],
    error: List<String>.from(json['error'].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    'error_field': errorField,
    'error': List<dynamic>.from(error?.map((x) => x) ?? []),
  };
}

String replaceCharacters(String text) =>
    capitalizeFirstLetter(text.replaceAll(RegExp('[\\W_]+'), ' '));

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return an empty string if the input is empty.
  }
  return input[0].toUpperCase() + input.substring(1);
}
