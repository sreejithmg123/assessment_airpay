import 'package:airapy_assessment/modules/home/model/article_details_arguments.dart';
import 'package:airapy_assessment/modules/home/model/article_response.dart';
import 'package:airapy_assessment/utils/font_palette.dart' show FontPalette;
import 'package:airapy_assessment/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({super.key, required this.results});
  final Results? results;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.pushNamed(
            context,
            RouteGenerator.routeArticleDetailsScreen,
            arguments: ArticleDetailsArguments(results: results),
          ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    results?.publishedDate ?? 'N/A',
                    style: FontPalette.blackMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    results?.section ?? 'N/A',
                    style: FontPalette.blackMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    results?.byline ?? 'N/A',
                    style: FontPalette.blackMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
