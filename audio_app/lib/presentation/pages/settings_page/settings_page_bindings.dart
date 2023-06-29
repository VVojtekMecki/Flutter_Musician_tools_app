import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
