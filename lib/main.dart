import 'package:flutter/material.dart';
import 'package:mobile_code_test_23001_daily_vita/route_config/route_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.ROUTE_SPLASH,
      onGenerateRoute: (settings) => RouteConfig.generateRoute(settings),
    );
  }
}