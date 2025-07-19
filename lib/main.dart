import 'package:chat_app/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app/features/home/bloc/home_bloc.dart';
import 'package:chat_app/shared/dependency_injection/injectable.dart';
import 'package:chat_app/shared/routes/navigator.dart';
import 'package:chat_app/shared/routes/route_generator.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:chat_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<ChatBloc>()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Machine Test',
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
          initialRoute: routeRoot,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
