import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:fictional_spork/core/abstractions/abstractions.dart';

class DioHttpHelper implements HttpHelper {
  DioHttpHelper({
    this.onResponse,
  }) {
    _dio = Dio();
  }
  late Dio _dio;
  final ValueChanged<HttpResponse>? onResponse;

  @override
  Future<HttpResponse> delete({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool processResponse = true,
    required String url,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      log(
        '${response.statusCode} $url',
        name: 'DELETE',
      );
      final httpResponse = _buildResponse(response);
      if (processResponse) {
        onResponse?.call(httpResponse);
      }
      return httpResponse;
    } on DioError catch (e, stackTrace) {
      final errResponse = _buildResponseWithError(e, stackTrace);
      if (processResponse && e.response != null) {
        onResponse?.call(errResponse);
      }
      return errResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> get({
    Duration? cacheAge,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool processResponse = true,
    required String url,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: params,
      );
      log(
        '${response.statusCode} $url',
        name: 'GET',
      );
      final httpResponse = _buildResponse(response);
      if (processResponse) {
        onResponse?.call(httpResponse);
      }
      return httpResponse;
    } on DioError catch (e, stackTrace) {
      final errResponse = _buildResponseWithError(e, stackTrace);
      if (processResponse && e.response != null) {
        onResponse?.call(errResponse);
      }
      return errResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> patch({
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool processResponse = true,
    required String url,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      log(
        '${response.statusCode} $url',
        name: 'PATCH',
      );
      final httpResponse = _buildResponse(response);
      if (processResponse) {
        onResponse?.call(httpResponse);
      }
      return httpResponse;
    } on DioError catch (e, stackTrace) {
      final errResponse = _buildResponseWithError(e, stackTrace);
      if (processResponse && e.response != null) {
        onResponse?.call(errResponse);
      }
      return errResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> post({
    Duration? cacheAge,
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool processResponse = true,
    required String url,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
      );

      log(
        '${response.statusCode} $url',
        name: 'POST',
      );
      final httpResponse = _buildResponse(response);
      if (processResponse) {
        onResponse?.call(httpResponse);
      }
      return httpResponse;
    } on DioError catch (e, stackTrace) {
      final errResponse = _buildResponseWithError(e, stackTrace);
      if (processResponse && e.response != null) {
        onResponse?.call(errResponse);
      }
      return errResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> put({
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    bool processResponse = true,
    required String url,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
        queryParameters: params,
      );
      log(
        '${response.statusCode} $url',
        name: 'PUT',
      );
      final httpResponse = _buildResponse(response);
      if (processResponse) {
        onResponse?.call(httpResponse);
      }
      return httpResponse;
    } on DioError catch (e, stackTrace) {
      final errResponse = _buildResponseWithError(e, stackTrace);
      if (processResponse && e.response != null) {
        onResponse?.call(errResponse);
      }
      return errResponse;
    } catch (e) {
      rethrow;
    }
  }

  HttpResponse _buildResponse(Response response) {
    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode ?? 400,
    );
  }

  HttpResponse _buildResponseWithError(DioError error, StackTrace stackTrace) {
    return HttpResponse(
      data: error.response?.data,
      statusCode: error.response?.statusCode ?? 400,
    );
  }
}
