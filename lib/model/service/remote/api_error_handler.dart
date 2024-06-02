

import 'dart:developer';
import 'package:dio/dio.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      log("===Exception");
      try {

        if (error is DioException) {
          log("===DioException");
          //print("Check Error>>>>> ${error.response!.statusCode}");

          log("Check Error Type : "+error.type.toString());
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to server was cancelled";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "bad certificate";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with server";
              break;
            case DioExceptionType.unknown:
              errorDescription = "Connection to server failed due to internet connection ";//${DioExceptionType.other.name}
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with server";
              break;
            case DioExceptionType.badResponse:
              errorDescription = "bad response";
              break;
            case DioExceptionType.connectionError:
              errorDescription = "connection error";
              break;
              // log("Check error status : ${error.response!.statusCode}");
              // switch (error.response!.statusCode) {
              //   case 404:
              //   case 401:
              //     errorDescription = "Something went wrong and you need to sign in again";
              //     break;
              //   case 500:
              //     errorDescription = "Something went wrong and you need to sign in again";
              //     break;
              //   case 503:
              //     errorDescription = error.response!.statusMessage;
              //     break;
              //   case 429:
              //     errorDescription = "Too many request";
              //     break;
              //   default:
              //     ErrorResponse errorResponse = ErrorResponse.fromJson(error.response!.data);
              //     // if (errorResponse.error != null &&
              //     //     errorResponse.error. > 0)
              //     if (errorResponse.error != null)
              //       errorDescription = errorResponse;
              //     else
              //       errorDescription = "Failed to load data - status code: ${error.response!.statusCode}";
              // }
              // break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString()+"FormatException";
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
