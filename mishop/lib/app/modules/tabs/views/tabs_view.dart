import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

import '../../../services/myIcons.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (value) {
            controller.setCurrentPage(value);
          },
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(MyIcons.home), label: "首页"),
              BottomNavigationBarItem(
                  icon: Icon(MyIcons.category), label: "分类"),
              BottomNavigationBarItem(icon: Icon(MyIcons.heart), label: "服务"),
              BottomNavigationBarItem(icon: Icon(MyIcons.cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(MyIcons.me), label: "我的"),
            ],
            onTap: (index) {
              controller.pageController.jumpToPage(index);
            },
            fixedColor: const Color.fromRGBO(225, 105, 23, 1),
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentPage.value,
          ),
        )));
  }
}
