
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomepageViewmodel extends GetxController {
  final RxInt pageIndex = 0.obs;
  bool get isHome => pageIndex.value == 0;
  final RxInt index = 0.obs;


  void setPage(int index) {
    pageIndex.value = index;
  }
}