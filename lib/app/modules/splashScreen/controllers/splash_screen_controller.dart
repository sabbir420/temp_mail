import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum AuthStatus{
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN
}

class SplashScreenController extends GetxController {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  final localStorage = GetStorage();
  
  @override
  void onInit() async {
    super.onInit();
    if( localStorage.read('token') == null ){
      authStatus = AuthStatus.NOT_LOGGED_IN;
    } else {
      authStatus = AuthStatus.LOGGED_IN;
    }
    changePage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePage() {
    Future.delayed(Duration(seconds: 2), () {
      switch(authStatus){
        case AuthStatus.NOT_DETERMINED: 
          Get.offAndToNamed('/signin');
          break;
        case AuthStatus.NOT_LOGGED_IN:
          Get.offAndToNamed('/signin');
          break;
        case AuthStatus.LOGGED_IN:
          Get.offAndToNamed('/home');
          break;
      }
    });
  }
}
