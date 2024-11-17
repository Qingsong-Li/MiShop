// ignore_for_file: invalid_use_of_protected_member


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
  late Widget _banner;
  late Widget _categorySwiper;
  @override
  void initState() {
    super.initState();
    buildBanner();
    buildCategorySwiper();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.controller.scrollController,
      children: [
        _banner,
        //官方商城、售后无忧、资质证明的图片
        SizedBox(
          height: ScreenAdaptor.height(92),
          width: ScreenAdaptor.width(1080),
          child: Image.asset(
            "assets/images/xiaomiBanner.png",
            fit: BoxFit.cover,
          ),
        ),
        _categorySwiper,

        const SizedBox(
          height: 2000,
        ),
      ],
    );
  }

//banner组件
  void buildBanner() {
    _banner = Container(
      height: ScreenAdaptor.width(682),
      width: ScreenAdaptor.width(1080),
      child: Obx(() => Swiper(
          curve: Curves.ease,
          autoplay: true,
          // control: null,
          autoplayDelay: 4000,
          duration: 500,
          itemCount: widget.controller.focusList.length,
          itemBuilder: (context, index) {
            return Image.network(
          
              widget.controller.focusList.value[index].pic!,
              fit: BoxFit.cover,
            );
          },
          pagination: SwiperPagination(
              builder: CustomSwiperPaginationBuilder(
                  space: 0,
                  height: ScreenAdaptor.height(8),
                  width: ScreenAdaptor.width(40),
                  activeWidth: ScreenAdaptor.width(40))))),
    );
  }

  void buildCategorySwiper() {
    _categorySwiper = Container(
      width: ScreenAdaptor.width(1080),
      height: ScreenAdaptor.height(480),
      // color: Colors.red,
      child: Obx(() => Swiper(
            loop: false,
            pagination: SwiperPagination(
                builder: CustomSwiperPaginationBuilder(
                    space: 0,
                    color: const Color.fromRGBO(239, 239, 239, 1),
                    activeColor: const Color.fromRGBO(166, 166, 166, 1),
                    height: ScreenAdaptor.height(8),
                    width: ScreenAdaptor.width(75),
                    activeWidth: ScreenAdaptor.width(75))),
            itemCount: widget.controller.categorySwiperList.value.length ~/ 10,
            itemBuilder: (context, i) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: ScreenAdaptor.width(20),
                      mainAxisSpacing: ScreenAdaptor.height(20)),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: ScreenAdaptor.height(140),
                          width: ScreenAdaptor.width(140),
                          child: Image.network(
                            widget.controller.categorySwiperList
                                .value[i * 10 + index].pic!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdaptor.height(5), 5, 0),
                          child: Text(
                            widget.controller.categorySwiperList
                                .value[i * 10 + index].title!,
                            style:
                                TextStyle(fontSize: ScreenAdaptor.fontSize(34)),
                          ),
                        )
                      ],
                    );
                  });
            },
          )),
    );
  }
}
