import 'package:booking_application/feature/event/data/cubit/event_list_cubit.dart';
import 'package:booking_application/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helper/notification_servece.dart';
import 'core/routing/app_routers.dart';
import 'core/routing/routes.dart';
import 'feature/event details/event_details_screen.dart';
import 'feature/nav bar/nav_bar_screen.dart';
import 'feature/onboarding/onboarding_screen.dart';
import 'feature/sign up/sign_up_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}



