import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:summer_school_app/core/route_manager/page_name.dart';
import 'package:summer_school_app/core/route_manager/route_manager.dart';
import 'package:summer_school_app/core/theme/themr.dart';
import 'package:summer_school_app/utility/database/local/absence.dart';
import 'package:summer_school_app/utility/database/local/cache_helper.dart';
import 'package:summer_school_app/utility/database/local/student.dart';
import 'package:summer_school_app/utility/database/network/dio-helper.dart';
import 'package:summer_school_app/view/core_widget/custom_animation/custom_animation.dart';
import 'package:summer_school_app/view_model/block/absence_cubit/absence_cubit.dart';
import 'package:summer_school_app/view_model/repo/absence_repo/absence.dart';

import 'core/service_locator/service_locator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await DioHelper.init();
  await CacheHelper.init();
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(appDocumentDir.path); // تهيئة Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AbsenceAdapter());  // Register the Absence adapter
  Hive.registerAdapter(StudentDataAdapter()); // Register StudentData adapter


  runApp(const MyApp());
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AbsenceCubit(sl.get<AbsenceRepo>())..checkConnection(),)
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          locale: const Locale('ar'),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          initialRoute: PageName.splash,
          getPages: pages,
          theme: ThemeApp.light,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
