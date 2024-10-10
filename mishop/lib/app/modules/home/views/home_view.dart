import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';
import '../../../services/screenAdaptor.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('HomeView'),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenAdaptor.height(683),
                  width: ScreenAdaptor.width(1080),
                  color: Colors.yellow,
                ),
                SizedBox(
                  height: ScreenAdaptor.height(20),
                ),
                Text("手机",
                    style: TextStyle(
                      fontSize: ScreenAdaptor.fontSize(34),
                    ))
              ],
            )));
  }
}
