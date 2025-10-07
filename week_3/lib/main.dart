import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(MyApp(appRouter: AppRouter()));
}
