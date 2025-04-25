

import 'package:airapy_assessment/utils/enums.dart' show ApiExceptions;

class ApiResponse {
  final ApiExceptions exceptions;
  final String? message;
  final dynamic data;

  ApiResponse({required this.exceptions, this.message, this.data});
}