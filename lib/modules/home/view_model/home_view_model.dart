import 'package:airapy_assessment/modules/home/model/article_response.dart';
import 'package:airapy_assessment/modules/home/repo/home_repo.dart';
import 'package:airapy_assessment/services/get_it.dart';
import 'package:airapy_assessment/services/helpers.dart' show Helpers;
import 'package:airapy_assessment/utils/enums.dart' show LoaderState;
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  LoaderState loaderState = LoaderState.loading;
  Helpers helpers = sl.get<Helpers>();
  HomeRepo homeRepo = sl.get<HomeRepo>();
  ArticleResponse? articleResponse;
  Future<void> getArticles() async {
    final network = await helpers.isInternetAvailable();
    if (network) {
      try {
        updateLoaderState(LoaderState.loading);
        homeRepo.getArticles().fold(
          (left) {
            updateLoaderState(LoaderState.error);
          },
          (right) {
            articleResponse = right;
            updateLoaderState(LoaderState.loaded);
          },
        );
      } catch (e) {
        updateLoaderState(LoaderState.error);
      }
    } else {
      updateLoaderState(LoaderState.networkErr);
    }
  }

  void updateLoaderState(LoaderState state) {
    loaderState = state;
    notifyListeners();
  }
}
