import 'package:dio/dio.dart';

class CategorySwiperModel {
  List<CategorySwiperItemModel>? result;

  CategorySwiperModel({this.result});

  // 通过 URL 发起请求并返回 CategorySwiperModel 实例
  static Future<CategorySwiperModel> fromUrl(String url) async {
    try {
      // 发起网络请求，获取数据
      Dio dio = Dio();
      final response = await dio.get(url);
      // 检查响应的状态
      if (response.statusCode == 200) {
        // print(response.data);
        // 如果请求成功，解析 JSON 数据并创建模型
        return CategorySwiperModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data from URL');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  CategorySwiperModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategorySwiperItemModel>[];
      json['result'].forEach((v) {
        result?.add(CategorySwiperItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategorySwiperItemModel {
  String? sId;
  String? title;
  int? status;
  String? pic;
  String? pid;
  int? sort;
  int? isBest;
  int? goProduct;
  String? productId;

  CategorySwiperItemModel(
      {this.sId,
      this.title,
      this.status,
      this.pic,
      this.pid,
      this.sort,
      this.isBest,
      this.goProduct,
      this.productId});

  CategorySwiperItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    var picStr = "https://miapp.itying.com/" + json['pic'];
    pic = picStr.replaceAll("\\", "/");
    pid = json['pid'];
    sort = json['sort'];
    isBest = json['is_best'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['pid'] = pid;
    data['sort'] = sort;
    data['is_best'] = isBest;
    data['go_product'] = goProduct;
    data['product_id'] = productId;
    return data;
  }
}
