import 'package:cimpl/login_service.dart';

abstract class BaseAuthenticatedService {
  var loginService = LoginService();

  Map<String, String> getHeaders() {
    return { "Content-Type": "application/json", "Authorization": "Bearer ${loginService.token}" };
  }
}