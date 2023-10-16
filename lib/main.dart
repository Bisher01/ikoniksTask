import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/devices/presentation/pages/device_list_screen.dart';

import 'core/const/style.dart';
import 'dependency_injection.dart';
import 'features/splash/presentaion/blocs/splash_bloc.dart';
import 'features/splash/presentaion/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task By Bisher',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme(),
      onGenerateRoute: (settings) {
        if (settings.name == SplashScreen.routeName) {
          return PageRouteBuilder(pageBuilder: (context, first, secondary) {
            return BlocProvider<SplashBloc>(
              create: (context) => di<SplashBloc>(),
              child: const SplashScreen(),
            );
          });
        }
        if (settings.name == DeviceListScreen.routeName) {
          return PageRouteBuilder(
            pageBuilder: (context, first, second) {
              return const DeviceListScreen();
            },
          );
        }
        return null;
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}


