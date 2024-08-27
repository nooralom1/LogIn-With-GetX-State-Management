import 'package:get/get.dart';
import 'package:login_with_getx/utils/local_storage/local_storage.dart';
import 'package:login_with_getx/view/screen/auth/sign_up/sign_up.dart';
import 'package:login_with_getx/view/screen/home/home.dart';

class SplashController extends GetxController {
  // late AnimationController animationController;
  // late Animation<double> animation;

  @override
  void onInit() {
    // animationInitialization();
    nextPage();
    super.onInit();
  }

  Future nextPage() async {
    String token =  await  LocalStorage().readData(key: "token") ?? "";
    await Future.delayed(const Duration(seconds: 2));
    if(token.isNotEmpty || token != ""){
      Get.to(() => const Home());
    }else{
      Get.to(() => const SignUp());
    }

  }

// animationInitialization() {
//   animationController =
//       AnimationController(vsync: this, duration: const Duration(seconds: 2));
//   animation =
//       CurvedAnimation(parent: animationController, curve: Curves.easeOut)
//           .obs
//           .value;
//   animation.addListener(() => update());
//   animationController.forward();
// }
}