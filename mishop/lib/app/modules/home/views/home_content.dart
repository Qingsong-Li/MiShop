// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishop/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:mishop/app/modules/home/tools/custom_scrollerBar.dart';
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
  late Widget _banner2;
  late Widget _bestSelling;
  @override
  void initState() {
    super.initState();
    buildBanner();
    buildCategorySwiper();
    buildBanner2();
    buildBestSelling();
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
        _banner2,
        _bestSelling,
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

//分类
  void buildCategorySwiper() {
    _categorySwiper = SizedBox(
        height: ScreenAdaptor.height(480),
        child: Obx(() => CustomScrollerBar(
            length: ScreenAdaptor.width(150),
            activeLength: ScreenAdaptor.width(75),
            width: ScreenAdaptor.width(10),
            activeColor: const Color.fromRGBO(166, 166, 166, 1),
            backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
            child: GridView.builder(
                primary: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.controller.categorySwiperList.value.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ScreenAdaptor.height(40)),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: ScreenAdaptor.height(140),
                        width: ScreenAdaptor.width(140),
                        child: Image.network(
                          widget
                              .controller.categorySwiperList.value[index].pic!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, ScreenAdaptor.height(5), 5, 0),
                        child: Text(
                          widget.controller.categorySwiperList.value[index]
                              .title!,
                          style:
                              TextStyle(fontSize: ScreenAdaptor.fontSize(34)),
                        ),
                      )
                    ],
                  );
                }))));
  }

// 
  void buildBanner2() {
    _banner2 = Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdaptor.width(20),
          ScreenAdaptor.height(15), ScreenAdaptor.width(20), 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/xiaomiBanner2.png",
                ),
                fit: BoxFit.cover)),
        height: ScreenAdaptor.height(420),
      ),
    );
  }

// 热销甄选
  void buildBestSelling() {
    _bestSelling = Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenAdaptor.width(30),
                ScreenAdaptor.height(40),
                ScreenAdaptor.width(30),
                ScreenAdaptor.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("热销臻选",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdaptor.fontSize(46))),
                Text("更多手机推荐 >",
                    style: TextStyle(fontSize: ScreenAdaptor.fontSize(38)))
              ],
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(ScreenAdaptor.width(20), 0,
              ScreenAdaptor.width(20), ScreenAdaptor.height(20)),
          child: Row(
            children: [
              //左侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdaptor.height(738),
                    child: Swiper(
                        itemBuilder: (context, index) {
                          String picUrl =
                              "https://www.itying.com/images/b_focus0${index + 1}.png";
                          return Image.network(
                            picUrl,
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        autoplay: true,
                        loop: true,
                        pagination: CustomSwiperPaginationBuilder(
                            space: 0,
                            color: Colors.black12,
                            bottom: ScreenAdaptor.height(20),
                            activeColor: Colors.black54,
                            height: ScreenAdaptor.height(8),
                            width: ScreenAdaptor.width(40),
                            activeWidth: ScreenAdaptor.width(40))),
                  )),
              SizedBox(width: ScreenAdaptor.width(20)),
              //右侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdaptor.height(738),
                    child: Column(
                      children: [
                        BestSellingCell(
                            title: "空气炸烤箱",
                            detail: "大容量更专业",
                            price: "众筹价¥345元",
                            picUrl:
                                "https://www.itying.com/images/kaoxiang.png"),
                        SizedBox(height: ScreenAdaptor.height(20)),
                        BestSellingCell(
                            title: "空气炸烤箱",
                            detail: "大容量更专业",
                            price: "众筹价¥345元",
                            picUrl: "https://www.itying.com/images/shouji.png"),
                        SizedBox(height: ScreenAdaptor.height(20)),
                        BestSellingCell(
                            title: "空气炸烤箱",
                            detail: "大容量更专业",
                            price: "众筹价¥345元",
                            picUrl: "https://www.itying.com/images/shouji.png"),
                      ],
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}

//热销甄选的块
// ignore: must_be_immutable
class BestSellingCell extends StatelessWidget {
  String title;
  String detail;
  String price;
  String picUrl;

  BestSellingCell(
      {super.key,
      required this.title,
      required this.detail,
      required this.price,
      required this.picUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(ScreenAdaptor.width(30))
          ),
          
          child: Row(
            children: [
              SizedBox(width: ScreenAdaptor.width(10),),
              Expanded(
                flex: 3,
                child: Column(
               
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenAdaptor.height(20)),
                    Text(title,
                        style: TextStyle(
                            fontSize: ScreenAdaptor.fontSize(38),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: ScreenAdaptor.height(20)),
                    Text(detail,
                        style: TextStyle(fontSize: ScreenAdaptor.fontSize(28),color: Colors.grey[700])),
                    SizedBox(height: ScreenAdaptor.height(20)),
                    Text(price,
                        style: TextStyle(fontSize: ScreenAdaptor.fontSize(34)))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(ScreenAdaptor.height(8)),
                  child: Image.network(picUrl, fit: BoxFit.scaleDown),
                ),
              )
            ],
          ),
        ));
  }
}
