import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class NetworkMockInterceptor extends Interceptor {
  NetworkMockInterceptor({
    required bool shouldMock,
    NetworkMockConfig? mockConfig,
  }) : _mockConfig = mockConfig ?? NetworkMockConfig(shouldMock: shouldMock);

  final NetworkMockConfig _mockConfig;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_mockConfig.shouldMock(options.path)) {
      await _mockRequest(options, handler);
    } else {
      handler.next(options);
    }
  }

  Future<void> _mockRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final ByteData data;
    final resourcePath = _mockConfig.getMockResourcePath(
      options.path,
    );
    try {
      data = await rootBundle.load(
        _mockConfig.getMockResourcePath(
          options.path,
        ),
      );
    } catch (error) {
      assert(
          false,
          '"$resourcePath" mock file for "${options.path}" endpoint, is either: '
          '\n1. absent at the required location, or '
          '\n2. incorrectly named, or '
          '\n3. the path to the mock file is not added into pubspec.yaml ');
      handler.next(options);
      return;
    }

    try {
      final delay = _mockConfig.mockDelay(options.path);
      if (delay != Duration.zero && !delay.isNegative) {
        await Future.delayed(delay);
      }

      final result = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      handler.resolve(
        Response(
          data: result,
          statusCode: 200,
          requestOptions: options,
        ),
      );
    } catch (error) {
      assert(
        false,
        'Failure parsing json mock at "$resourcePath", ',
      );
      handler.next(options);
    }
  }
}

class NetworkMockConfig {
  const NetworkMockConfig({required bool shouldMock})
      : _shouldMockFallback = shouldMock;

  final bool _shouldMockFallback;

  bool shouldMock(String path) => _shouldMockFallback;

  Duration mockDelay(String path) => const Duration(seconds: 1);

  String mocksBaseDirectory() => 'assets/mocks';

  String mockFileExtension(String path) => '.json';

  String getMockResourcePath(String path) =>
      '${mocksBaseDirectory()}$path${mockFileExtension(path)}';
}
