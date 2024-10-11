import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishop/app/services/myIcons.dart';
import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/screenAdaptor.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: ScreenAdaptor.height(-180),
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          width: ScreenAdaptor.width(1080),
                          height: ScreenAdaptor.height(682),
                          child: Image.network(
                            "https://www.itying.com/images/focus/focus02.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return ListTile(title: Text("第$index个列表"));
                      }
                    },
                  )),
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

class MyAppBar extends StatefulWidget {
  final HomeController controller;
  const MyAppBar({super.key, required this.controller});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdaptor.height(130),
      width: ScreenAdaptor.width(1080),
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: ScreenAdaptor.width(48),
              child: AnimatedBuilder(
                  animation: widget.controller.xiaomiAnimation,
                  builder: (context, child) {
                    return Icon(
                      MyIcons.xiaomi,
                      color: Color.fromRGBO(252, 251, 249,
                          widget.controller.xiaomiAnimation.value),
                      size: 35,
                    );
                  })),
          Positioned(
              top: ScreenAdaptor.height(20),
              bottom: ScreenAdaptor.height(20),
              right: ScreenAdaptor.width(270),
              child: AnimatedBuilder(
                  animation: widget.controller.textfieldAnimation,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(252, 243, 236, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: widget.controller.textfieldAnimation.value,
                      child: TextField(
                        cursorHeight: ScreenAdaptor.height(50),
                        cursorColor: Colors.grey,
                        cursorRadius: const Radius.circular(15),
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: "手机",
                            hintStyle: TextStyle(
                                color: const Color.fromRGBO(195, 187, 177, 1),
                                fontSize: ScreenAdaptor.fontSize(38)),
                            contentPadding: EdgeInsets.fromLTRB(
                                20, ScreenAdaptor.height(0), 0, 0),
                            border: InputBorder.none,
                            prefixIconConstraints: BoxConstraints(
                              maxWidth: ScreenAdaptor.width(100),
                              minWidth: ScreenAdaptor.width(100),
                              maxHeight: ScreenAdaptor.width(100),
                              minHeight: ScreenAdaptor.width(100),
                            ),
                            prefixIcon: const Icon(
                              MyIcons.search,
                              color: Color.fromRGBO(189, 181, 171, 1),
                              size: 21,
                            )),
                      ),
                    );
                  })),
          Positioned(
              top: 0,
              bottom: 0,
              right: ScreenAdaptor.width(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: widget.controller.postfixIconAnimation,
                      builder: (context, child) {
                        return InkWell(
                          child: Icon(
                            MyIcons.qrCode,
                            color: widget.controller.postfixIconAnimation.value,
                            size: 30,
                          ),
                        );
                      }),
                  SizedBox(width: ScreenAdaptor.width(50)),
                  AnimatedBuilder(
                      animation: widget.controller.postfixIconAnimation,
                      builder: (context, child) {
                        return InkWell(
                          child: Icon(
                            MyIcons.message,
                            color: widget.controller.postfixIconAnimation.value,
                            size: 30,
                          ),
                        );
                      }),
                ],
              ))
        ],
      ),
    );
  }
}

class _MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    // 单方面宣布自己胜出
    acceptGesture(pointer);
  }
}
