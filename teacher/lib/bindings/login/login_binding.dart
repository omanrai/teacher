import '../../services/oauth_client_service.dart';

import '../../controllers/login/login_controller.dart';
import '../../services/auth_api_service.dart';
import '../../services/cache_service.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        Get.find<AuthApiService>(), Get.find<OAuthClientService>()));
  }
}
