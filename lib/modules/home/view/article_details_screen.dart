import 'package:airapy_assessment/modules/home/model/article_response.dart';
import 'package:airapy_assessment/utils/font_palette.dart' show FontPalette;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.results});
  final Results? results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles Details Screen',
          style: FontPalette.blackMedium.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                results?.publishedDate ?? 'N/A',
                style: FontPalette.blackMedium,
              ),
              10.verticalSpace,
              Text(results?.section ?? 'N/A', style: FontPalette.blackMedium),
              10.verticalSpace,
              Text(results?.byline ?? 'N/A', style: FontPalette.blackMedium),
              10.verticalSpace,
              Text(results?.title ?? 'N/A', style: FontPalette.blackMedium),
              10.verticalSpace,
              Text(
                results?.adxKeywords ?? 'N/A',
                style: FontPalette.blackMedium,
              ),
              10.verticalSpace,
              Text(results?.abstract ?? 'N/A', style: FontPalette.blackMedium),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
