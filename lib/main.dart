import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weahter/core/di/injection.dart';
import 'package:weahter/core/routing/app_router.dart';
import 'package:weahter/weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  init();
  runApp(
    WeatherApp(
      appRouter: AppRouter(),
    ),
  );
}
