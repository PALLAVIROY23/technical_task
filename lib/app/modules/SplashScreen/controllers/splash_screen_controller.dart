import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/constants.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {

  GetStorage box = GetStorage();


  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration (seconds:  3), (){
      if(box.read(Constant.TOKEN) == null || box.read(Constant.TOKEN) == ""){
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      }else{
        Get.offAllNamed(Routes.HOME);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
