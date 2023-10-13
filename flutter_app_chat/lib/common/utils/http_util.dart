//
//
// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:dio/dio.dart';
//
// class HttpUtil {
//   static  HttpUtil _instance = HttpUtil._internal();
//   factory HttpUtil() => _instance;
//
//   late Dio dio;
//   CancelToken cancelToken = CancelToken();
//   HttpUtil._internal() {
//     BaseOptions options = BaseOptions(
//         baseUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
//         connectTimeout: const Duration(milliseconds: 10000),
//         receiveTimeout: const Duration(milliseconds: 5000),
//         headers: {},
//     );
//     dio = Dio(options);
//   }
//
//   Future<Response> get(String url, {Map<String, dynamic>? params}) async {
//     try {
//       Response response = await dio.get(url, queryParameters: params, cancelToken: cancelToken);
//     } on DioError catch(e) {
//       throw Exception('Failed to GET $url: $e');
//     }
//     return response;
//   }
//
// }