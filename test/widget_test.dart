import 'package:flutter_test/flutter_test.dart';
import 'package:task/dependency_injection.dart';
import 'package:task/features/devices/presentation/pages/search_devices_screen.dart';
import 'package:task/features/splash/presentation/splash_screen.dart';
import 'package:task/main.dart';

void main() {
  testWidgets(
    'expect splash screen when we open the app',
    (WidgetTester tester) async {
      await inject();
      await tester.runAsync(
        () async {
          await tester.pumpWidget(const MyApp());
          expect(find.byType(SplashScreen), findsOneWidget);
          expect(find.byType(SearchDevicesScreen), findsNothing);
        },
      );
    },
  );
}
