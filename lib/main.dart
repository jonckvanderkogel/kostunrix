import 'package:cimpl/login_service.dart';
import 'package:cimpl/route_service.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'insurance_requests_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final LoginService _loginService = LoginService();
  static final RouteService _routeService = RouteService();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cimpl',
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[_routeService.routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) {
              return _loginService.isLoggedIn() ? InsuranceRequestsPage() : LoginPage();
            });
          case 'login-page':
            return MaterialPageRoute(builder: (_) => LoginPage());
          case 'insurance-requests-page':
            return MaterialPageRoute(builder: (_) => InsuranceRequestsPage());
        }
      },
    );
  }
}
