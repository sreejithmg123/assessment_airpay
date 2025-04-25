import 'package:airapy_assessment/modules/home/model/article_response.dart';
import 'package:airapy_assessment/services/api_response.dart' show ApiResponse;
import 'package:airapy_assessment/services/api_services.dart' show HttpReq;
import 'package:airapy_assessment/services/get_it.dart';
import 'package:airapy_assessment/utils/enums.dart' show ApiExceptions;
import 'package:either_dart/either.dart';

class HomeRepo {
  HttpReq httpReq = sl.get<HttpReq>();

  Future<Either<ApiResponse, dynamic>> getArticles() async {
    return httpReq
        .getRequest(
          'https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=RGpHsimZsCm11mwnkG7esltRLnN72j86',
        )
        .thenRight((right) {
          ArticleResponse articleResponse = ArticleResponse.fromJson(right);
          return Right(articleResponse);
        })
        .thenLeft((left) => Left(left))
        .onError((error, stackTrace) {
          return Left(ApiResponse(exceptions: ApiExceptions.error));
        });
  }
}
