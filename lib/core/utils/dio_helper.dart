import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://umlcc.chd-staging.tech/api/c/app/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>getData({
    required String url,
    Map<String , dynamic>? query,
    String lang='en',
    String? token,
  })async
  {
    dio.options.headers=
    {
      'Content-Type' : 'application/json',
    };
    return await dio.get(url,queryParameters:
    query,);
  }


  static Future<Response> postData({
    Map<String,dynamic>? headers,
    required url,
    required Map<String,dynamic> data
  })async
  {

    dio.options.headers=
    headers??{
      'Content-Type' : 'application/json',
    };

    return await dio.post(
        url,
        data: data
    );

  }

  static Future<Response> putData({
    required String url,
    Map<String ,dynamic>?query,
    required Map<String ,dynamic>data,
    String lang='en',
    String? token,

  }) async
  {
    dio.options.headers=
    {
      'lang' : lang,
      'Authorization' : token
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
