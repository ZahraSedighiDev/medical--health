import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../profile_viewmodel/profile_viewmodel.dart';

class SecondpageBinding extends Bindings {
  @override
  void dependencies() {
    {
      Get.lazyPut<ProfileViewmodel>(() => ProfileViewmodel());
    }
  }}
