import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
        
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
            items: const [
              BottomNavigationBarItem(
                  icon: InkWell(
                    child: Icon(Icons.home),
                  ),
                  label: "首页"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_search), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.heart_broken), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
            ],
            onTap: (index) {
              controller.pageController.jumpToPage(index);
            },
            fixedColor: Colors.orange[400],
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentPage.value,
          ),
        )));
  }
}
