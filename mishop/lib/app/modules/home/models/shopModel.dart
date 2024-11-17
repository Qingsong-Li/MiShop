import 'package:dio/dio.dart';

class ShopModel {
  String? sId;
  String? title;
  int? status;
  String? pic;
  String? url;

  ShopModel({this.sId, this.title, this.status, this.pic, this.url});

  ShopModel.fromJson(Map<String, dynamic> json) {
    sId = json["_id"];
    title = json["title"];
    status = int.tryParse(json["status"]);
    // ignore: prefer_interpolation_to_compose_strings
    var picStr = "https://xiaomi.itying.com/" + json["pic"];
    pic = picStr.replaceAll("\\", "/");
    url = json["url"];
  }

  static Future<List<ShopModel>> requestWithUrl(String url) async {
    List<ShopModel> shopmodels = [];
    var response = await Dio().get(url);
    List datas = response.data["result"];
    // print(datas);

    shopmodels = datas.map((data) {
      return ShopModel.fromJson(data);
    }).toList();

    return shopmodels;
  }
}
