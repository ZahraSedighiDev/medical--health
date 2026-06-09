import 'package:get/get.dart';
import 'package:medical_health_title/features/thirdpage/thirdpage_viewmodel/thirdpage_viewmodel.dart';

class ThirdpageBinding extends Bindings {
  @override
  void dependencies() {
    {
      Get.lazyPut<ThirdpageViewmodel>(() => ThirdpageViewmodel());
    }
  }}