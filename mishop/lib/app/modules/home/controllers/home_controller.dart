import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mishop/app/modules/home/models/shopModel.dart';
import 'package:mishop/app/services/screenAdaptor.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  RxList<ShopModel> focusList = <ShopModel>[].obs;

  final ScrollController scrollController =
      ScrollController(); // ListView的滚动控制器

  late final AnimationController animationController;
  late final textfieldAnimation; //输入框延长的动画
  late final xiaomiAnimation; //小米logo消失的动画
  late final postfixIconAnimation; //二维码和消息Icon颜色变化的动画
  late final backgroundAnimation; //背景高斯模糊的动画

  // 根据滚动距离更新动画进度
  void updateAnimation(double offset) {
    if (offset < 50) {
      animationController.value = 0;
    } else if (offset > 150) {
      animationController.value = 1;
    }
    // 将滚动距离映射到动画的进度范围
    double progress = (offset - 50) / (150 - 50);
    progress = progress.clamp(0.0, 1.0); // 确保在0到1之间
    animationController.value = progress; // 更新动画值
  }

  @override
  void onInit() {
    super.onInit();
    animateInit();
    getFocusData();
  }

// 数据初始化
  void getFocusData() async {
    focusList.value =
        await ShopModel.requestWithUrl("https://miapp.itying.com/api/focus");
  }

// banner动画初始化
  void animateInit() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    textfieldAnimation = Tween<double>(
            begin: ScreenAdaptor.width(610), end: ScreenAdaptor.width(750))
        .animate(animationController);
    xiaomiAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
    postfixIconAnimation = ColorTween(
            begin: const Color.fromRGBO(254, 253, 249, 1), end: Colors.black)
        .animate(animationController);
    backgroundAnimation =
        Tween<double>(begin: 0, end: 20).animate(animationController);

    // 监听滑动
    scrollController.addListener(() {
      // 如果一次性滑动过快，会导致pixel一下从比如100跳到200，这样动画效果就会卡在100
      // if (scrollController.position.pixels >= 50 &&
      //     scrollController.position.pixels <= 150) {
      //   updateAnimation(scrollController.position.pixels);
      //   return;
      // }
      updateAnimation(scrollController.position.pixels);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    scrollController.dispose();
  }
}
