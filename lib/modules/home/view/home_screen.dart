import 'package:airapy_assessment/modules/home/view/widgets/article_list_tile_widgets.dart';
import 'package:airapy_assessment/modules/home/view_model/home_view_model.dart';
import 'package:airapy_assessment/utils/enums.dart';
import 'package:airapy_assessment/utils/font_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeViewModel>().getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Articles',
          style: FontPalette.blackMedium.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Consumer<HomeViewModel>(
        builder:
            (context, homeProvider, child) =>
                _HomeScreenHandler(homeViewModel: homeProvider),
      ),
    );
  }
}

class _HomeScreenHandler extends StatelessWidget {
  const _HomeScreenHandler({required this.homeViewModel});
  final HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    return switch (homeViewModel.loaderState) {
      LoaderState.loaded => ListView.separated(
        itemCount: (homeViewModel.articleResponse?.results ?? []).length,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.0),
        separatorBuilder: (context, index) => 10.verticalSpace,
        itemBuilder:
            (context, index) => ArticleListTile(
              results: homeViewModel.articleResponse?.results?[index],
            ),
      ),
      LoaderState.loading => Center(child: const CircularProgressIndicator()),
      LoaderState.error => Center(
        child: Text('Oops Error', style: FontPalette.blackBold),
      ),
      LoaderState.networkErr => Center(
        child: Text('Network Error', style: FontPalette.blackBold),
      ),
      LoaderState.noData => Center(
        child: Text('No Data Found', style: FontPalette.blackBold),
      ),
    };
  }
}
