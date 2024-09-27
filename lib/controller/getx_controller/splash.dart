import 'package:get/get.dart';
import 'package:login_with_getx/controller/local_storage/local_storage.dart';
import 'package:login_with_getx/firebase/user_add/user_add.dart';

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
    String token = await LocalStorage().readData(key: "token") ?? "";
    await Future.delayed(const Duration(seconds: 2));
    if (token.isNotEmpty || token != "") {
      Get.to(() => const UserAdd());
    } else {
      Get.to(() => const UserAdd());
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
