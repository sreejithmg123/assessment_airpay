import 'package:airapy_assessment/modules/home/view/home_screen.dart';
import 'package:airapy_assessment/modules/home/view_model/home_view_model.dart';
import 'package:airapy_assessment/services/get_it.dart';
import 'package:airapy_assessment/utils/font_palette.dart';
import 'package:airapy_assessment/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontPalette.themFont,
            scaffoldBackgroundColor: Colors.white,
          ),
          onGenerateRoute: RouteGenerator.instance.generateRoute,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
