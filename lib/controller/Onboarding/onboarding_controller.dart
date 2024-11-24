import 'package:get/get.dart';
import 'package:sehat_yaab/model/onboard.dart';

class OnBoardingController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Onboard> data = [
    Onboard(
        name: "assets/images/img_intro1.png",
        title: "Welcome to Sehat Yaab",
        description: "Looking for a specialist you are at right place"),
    Onboard(
        name: "assets/images/img_intro2.png",
        title: "Welcome to Sehat Yaab",
        description: "Looking for a specialist you are at right place"),
    Onboard(
        name: "assets/images/img_intro3.png",
        title: "Welcome to Sehat Yaab",
        description: "Looking for a specialist you are at right place"),
  ];
}
