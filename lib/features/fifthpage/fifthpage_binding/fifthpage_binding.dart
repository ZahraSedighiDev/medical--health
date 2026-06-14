
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medical_health_title/features/fifthpage/fifthpage_viewmodel/fifthpage_viewmodel.dart';

class FifthpageBinding extends Bindings {
  @override
  void dependencies() {
    {
      Get.lazyPut<FifthpageViewmodel>(() => FifthpageViewmodel());
    }
  }}