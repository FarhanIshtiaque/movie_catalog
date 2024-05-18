import 'package:get/get.dart';
import 'package:movie_catalog/config/network_service/network_controller.dart';


class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
