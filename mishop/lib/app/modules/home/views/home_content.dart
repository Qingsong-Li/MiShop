import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishop/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:mishop/app/modules/home/tools/custom_swiper_pagination_builder.dart';
import 'package:mishop/app/services/screenAdaptor.dart';

class MainContent extends StatefulWidget {
  final HomeController controller;
  const MainContent({super.key, required this.controller});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  late Widget banner;
  @override
  void initState() {
    super.initState();
    banner = Container(
      height: ScreenAdaptor.width(682),
      width: ScreenAdaptor.width(1080),
      child: Obx(() => Swiper(
          autoplay: true,
          // control: null,
          duration: 3000,
          itemCount: widget.controller.focusList.length,
          itemBuilder: (context, index) {
            return Image.network(
            
              // ignore: invalid_use_of_protected_member
              widget.controller.focusList.value[index].pic!,
              fit: BoxFit.cover,
            );
          },
          pagination: SwiperPagination(
              builder: CustomSwiperPaginationBuilder(
                  space: 0,
                  size: ScreenAdaptor.width(40),
                  activeSize: ScreenAdaptor.width(40))))),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: widget.controller.scrollController,
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return banner;
          } else {
            return ListTile(
              title: Text("第${index}条数据"),
            );
          }
        });
  }
}
