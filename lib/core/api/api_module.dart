import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_end_points.dart';

class ApiModule {
  final Dio dio;

  ApiModule()
    : dio = Dio(
        BaseOptions(
          baseUrl: APIEndPoints.baseUrl,
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 3),
          sendTimeout: Duration(seconds: 5),
        ),
      ) {
    dio.options.headers = {"Accept": "application/json"};
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,

          responseBody: false,
          error: true,
          compact: true,
        ),
      );
    }
  }
}
