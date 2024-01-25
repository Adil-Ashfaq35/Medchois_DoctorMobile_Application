import 'dart:io';
import 'package:dio/dio.dart';
import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  final Dio _dio = Dio();

  /// Get Request

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      var headers = {
        'Content-Type': 'application/json'
      };
      final response = await _dio.get( baseUrl + url,
          options: Options(
            headers: headers,
            method: 'GET',
          )
      );

      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw FetchDataException('No Internet Connection');
      } else {
        throw e;
      }
    }
    return responseJson;
  }

  /// post Request


  Future postResponse(String url, Map<String, String> jsonBody) async {
    dynamic responseJson;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      };
      final response = await _dio.post(url,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
         data: jsonBody,
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



  /// request response check


  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200 :
        dynamic responseJson = response.data;
         return responseJson;
      case 400 :
        throw BadRequestException(response.toString());
      case 401 :
      case 403 :
        throw UnauthorisedException(response.data.toString());
      case 404 :
        throw UnauthorisedException(response.data.toString());
      case 500 :
      default :
        throw FetchDataException(
            'Error occurred while communication with server' + ' with status code : ${response.statusCode}');
    }
  }
}







// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
//
// import '../../../data/app_exceptions.dart';
// import 'BaseApiService.dart';
//
//
// class NetworkApiService extends BaseApiService {
//
//   @override
//   Future getResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response = await http.get(Uri.parse(baseUrl + url));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   Future postResponse(String url, Map<String, String> jsonBody) async {
//     dynamic responseJson;
//     try {
//       final response =
//       await http.post(Uri.parse(url), body: jsonBody);
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occurred while communication with server' +
//                 ' with status code : ${response.statusCode}');
//     }
//   }
// }