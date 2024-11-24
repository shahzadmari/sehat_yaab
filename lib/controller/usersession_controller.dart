import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserSessionController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isFirstTime = false.obs;
  RxString userType = "".obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    isLoggedIn.value = storage.read('isLoggedIn') ?? false;
    isFirstTime.value = storage.read('isFirstTime') ?? false;
    userType.value = storage.read('userType') ?? "";
  }
}
