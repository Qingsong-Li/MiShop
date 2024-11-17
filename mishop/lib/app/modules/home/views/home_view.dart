import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishop/app/modules/home/views/home_appbar.dart';
import 'package:mishop/app/modules/home/views/home_content.dart';

import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/screenAdaptor.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        backgroundColor:Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: ScreenAdaptor.height(-180),
                left: 0,
                right: 0,
                bottom: 0,
                child: MainContent(controller: controller)),

            // 用于实现APPBar的高斯模糊的背景
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                    animation: controller.backgroundAnimation,
                    builder: (context, child) {
                      return ClipRRect(
                        // 宽度填满
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: controller.backgroundAnimation.value,
                              sigmaY: controller
                                  .backgroundAnimation.value), // 设置模糊半径
                          child: Container(
                            height: ScreenAdaptor.height(265), // 高度
                            width: double.infinity,
                            color: Colors.transparent, // 保持透明以显示模糊效果
                          ),
                        ),
                      );
                    })),

            Positioned(
              top: ScreenAdaptor.height(135),
              left: 0,
              right: 0,
              child: MyAppBar(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
