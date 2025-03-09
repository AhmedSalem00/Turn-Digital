import 'package:booking_application/feature/event/data/cubit/event_list_cubit.dart';
import 'package:booking_application/feature/home/home_screen.dart';
import 'package:booking_application/feature/nav%20bar/nav_bar_screen.dart';
import 'package:booking_application/feature/onboarding/onboarding_screen.dart';
import 'package:booking_application/feature/sign%20in/login_screen.dart';
import 'package:booking_application/feature/sign%20up/sign_up_screen.dart';
import 'package:booking_application/feature/verification/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/event/event_list_screen.dart';
import '../../feature/home/cubit/event_cubit.dart';
import '../../feature/home/cubit/location_cubit.dart';
import '../../feature/home/data/repos/event_repos.dart';
import '../../feature/verification/data/cubit/verification_cubit.dart';
import 'app_routers.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => EventCubit(ApiService())),
                  BlocProvider(
                    create: (context) => LocationCubit()..fetchLocation(),
                  ),
                  BlocProvider(
                    create: (context) => EventsListCubit(),
                    lazy: false,
                  ),
                ],
                child: MainScreen(),
              ),
        );
      case Routes.eventsListScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<EventsListCubit>(
                create: (context) => EventsListCubit(),
                child: EventsListScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => VerificationCubit(),
                child: VerificationScreen(),
              ),
        ); //
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
