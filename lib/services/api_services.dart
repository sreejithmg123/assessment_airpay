import 'dart:convert';
import 'dart:io';
import 'package:airapy_assessment/utils/enums.dart' show ApiExceptions;
import 'package:either_dart/either.dart';
import 'api_response.dart';
import 'get_it.dart';
import 'helpers.dart';
import 'package:http/http.dart' as api_service;

class HttpReq {
  Helpers helpers = sl.get<Helpers>();

  final String _appJson = 'application/json';

  Future<Either<ApiResponse, dynamic>> getRequest(
    String endPoint, {
    Map<String, dynamic>? param,
  }) async {
    try {
      bool networkStat = await helpers.isInternetAvailable();
      if (!networkStat) {
        return Left(ApiResponse(exceptions: ApiExceptions.networkError));
      }
      Uri uri = Uri.parse(endPoint);

      var response = await api_service
          .get(
            uri,
            headers: <String, String>{
              HttpHeaders.acceptHeader: _appJson,
              HttpHeaders.contentTypeHeader: _appJson,
            },
          )
          .timeout(const Duration(seconds: 60));
      return _returnResponse(response, endPoint);
    } catch (_) {
      return Left(ApiResponse(exceptions: ApiExceptions.error));
    }
  }

  Either<ApiResponse, dynamic> _returnResponse(
    api_service.Response response,
    String endpoint,
  ) {
    switch (response.statusCode) {
      case 200:
        return Right(jsonDecode(response.body));
      case 401:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.authErr,
            message: 'Not authorised please login',
          ),
        );
      case 403:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.authErr,
            message: 'Not authorised please login',
          ),
        );
      case 400:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.error,
            message: 'Oops something went wrong, Try again',
            data: jsonDecode(response.body),
          ),
        );
      case 422:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.error,
            message: 'Oops something went wrong, Try again',
            data: jsonDecode(response.body),
          ),
        );
      case 500:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.error,
            message: 'Oops something went wrong, Try again',
          ),
        );
      default:
        return Left(
          ApiResponse(
            exceptions: ApiExceptions.error,
            message: 'Something went wrong, Try again',
          ),
        );
    }
  }
}
