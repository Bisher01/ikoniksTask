import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../devices/presentation/pages/device_list_screen.dart';
import 'blocs/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(const StartSplashTimer(timer: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushReplacementNamed(context, DeviceListScreen.routeName);
          }
        },
        child: const Center(
          child: FlutterLogo(
            size: 250,
          ),
        ),
      ),
    );
  }
}
