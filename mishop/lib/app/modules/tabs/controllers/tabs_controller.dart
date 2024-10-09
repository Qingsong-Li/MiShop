import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../service/views/service_view.dart';
import '../../cart/views/cart_view.dart';
import '../../user/views/user_view.dart';
class TabsController extends GetxController {
  //TODO: Implement TabsController
  RxInt currentPage = 0.obs;
  final pages =const  [
    HomeView(),
    CategoryView(),
    ServiceView(),
    CartView(),
    UserView()
  ];
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
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

  void  setCurrentPage(int index){
    currentPage.value = index;
    update();
  }

}
