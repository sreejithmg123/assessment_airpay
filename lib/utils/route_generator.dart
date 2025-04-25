import 'package:airapy_assessment/modules/home/model/article_details_arguments.dart';
import 'package:airapy_assessment/modules/home/view/article_details_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static RouteGenerator? _instance;

  static RouteGenerator get instance {
    _instance ??= RouteGenerator();
    return _instance!;
  }

  static const String routeArticleDetailsScreen = '/articleDetailsScreen';

  Route generateRoute(RouteSettings settings, {var routeBuilders}) {
    var args = settings.arguments;
    switch (settings.name) {
      case routeArticleDetailsScreen:
        ArticleDetailsArguments? arguments;
        if (args != null) {
          arguments = args as ArticleDetailsArguments;
        }
        return _buildRoute(
          routeArticleDetailsScreen,
          ArticleDetailsScreen(results: arguments?.results),
        );
      default:
        return _buildRoute(routeArticleDetailsScreen, const SizedBox());
    }
  }

  Route _buildRoute(
    String route,
    Widget widget, {
    bool enableFullScreen = false,
  }) {
    return MaterialPageRoute(
      fullscreenDialog: enableFullScreen,
      settings: RouteSettings(name: route),
      builder: (_) => widget,
    );
  }
}
