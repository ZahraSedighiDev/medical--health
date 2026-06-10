import 'package:get/get.dart';

class SecondpageViewmodel extends GetxController{
  final selectedCategori = 0.obs ;
  void changeCategori(int index){
    selectedCategori.value = index;

  }
}