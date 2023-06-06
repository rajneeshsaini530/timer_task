import 'package:dio/dio.dart';

/// Interceptor to send the bearer access token
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // create a list of the endpoints where you don't need to pass a token.
    final listOfPaths = <String>[
      '/login',
    ];

    // if there is no need to pass the token in the header
    if (listOfPaths.contains(options.path.toString())) {
      // if the endpoint is matched then return without auth token
      return handler.next(options);
    }

    // Get the token from the session and pass here
    var token = '';
    options.headers.addAll({'Authorization': token});
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  //If there is an error
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
