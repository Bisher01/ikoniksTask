import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/const/style.dart';
import 'dependency_injection.dart' as dii;
import 'dependency_injection.dart';
import 'features/devices/presentation/blocs/device_bloc.dart';
import 'features/devices/presentation/pages/device_list_screen.dart';
import 'features/splash/presentation/blocs/splash_bloc.dart';
import 'features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dii.inject();
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
          return PageRouteBuilder(pageBuilder: (context, first, second) {
            return BlocProvider<DeviceBloc>(
              create: (context) => di<DeviceBloc>(),
              child: const DeviceListScreen(),
            );
          });
        }
        return null;
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
