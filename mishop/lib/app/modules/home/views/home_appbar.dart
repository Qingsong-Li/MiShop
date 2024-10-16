import 'package:flutter/material.dart';
import 'package:mishop/app/modules/home/controllers/home_controller.dart';
import 'package:mishop/app/services/myIcons.dart';

import '../../../services/screenAdaptor.dart';

class MyAppBar extends StatefulWidget {
  final HomeController controller;
  const MyAppBar({super.key, required this.controller});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }
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
              top: ScreenAdaptor.height(25),
              bottom: ScreenAdaptor.height(25),
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
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, ScreenAdaptor.height(35)),
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