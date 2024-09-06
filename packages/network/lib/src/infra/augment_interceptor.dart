import 'dart:convert';

import 'package:dio/dio.dart';

import '../consts.dart';
import '../request/request_settings.dart';
import 'augmentation/auth_provider.dart';
import 'augmentation/request_augmentor.dart';

class EnrichInterceptor extends Interceptor {
  const EnrichInterceptor({
    required this.authProvider,
    required this.requestAugmentor,
  });

  final AuthProvider authProvider;
  final RequestAugmentor requestAugmentor;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isOpenEndpoint = options.extra[flagIsOpenEndpoint] == true;
    final isAuthRequired = !isOpenEndpoint;

    if (isAuthRequired && !(await authProvider.isAuthenticated())) {
      if (!(await authProvider.reAuthenticate(options.path))) {
        handler.reject(
          DioException(
            response: Response(
              statusCode: 0,
              statusMessage: authError,
              requestOptions: options,
            ),
            requestOptions: options,
          ),
        );
      }
    }

    final augmentedBody = await requestAugmentor.body();

    final authBody = isAuthRequired ? await authProvider.getAuthBody() : null;

    final requestBody = options.data;

    options
      ..data = json.encode({
        ...?requestBody,
        ...?augmentedBody,
        ...?authBody,
      })
      ..headers.addAll(
        {
          ...?await requestAugmentor.headers(
            serviceSettings: options.extra,
          ),
          if (isAuthRequired) ...?await authProvider.getAuthHeaders(),
        },
      );
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) =>
      handler.next(err);
}
