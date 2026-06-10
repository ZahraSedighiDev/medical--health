import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../viewmodel/homepage_viewmodel.dart';

class HomeAuthBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomepageViewmodel>(() => HomepageViewmodel());
  }
}