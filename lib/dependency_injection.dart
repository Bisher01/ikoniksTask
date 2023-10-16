import 'package:get_it/get_it.dart';

import 'features/splash/presentaion/blocs/splash_bloc.dart';

final di = GetIt.instance;

Future<void> inject() async {

  //==========Splash==========//
  di.registerFactory<SplashBloc>(() => SplashBloc());
}