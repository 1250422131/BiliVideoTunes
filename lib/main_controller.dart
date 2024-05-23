import 'package:get/get.dart';

class MainController extends GetxController {
  RxDouble panelPosition = 1.0.obs;

  RxInt currentPage = 0.obs;

  RxBool showBottomNav = true.obs;
}
