import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../services/keepAliveWrapper.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('HomeView'),
              centerTitle: true,
            ),
            body: ListView(
              children: const [
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("2222222"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("444444444444"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("11111111"),
                ),
                ListTile(
                  title: Text("555555555"),
                ),
              ],
            )));
  }
}
