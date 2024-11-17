class ApiUrls {
  // 根据不同环境配置基础 URL
  static const String _baseUrlDev = "https://miapp.itying.com";
  static const String _baseUrlProd = "https://api.example.com";
  
  // 可以根据当前环境切换基础 URL
  static String get baseUrl {
    // 在这里根据当前环境选择基础 URL，默认返回开发环境的 URL
    // 你可以通过配置文件或环境变量来动态切换环境
    bool isProd = false;  // 例如根据配置来判断是否是生产环境
    // ignore: dead_code
    return isProd ? _baseUrlProd : _baseUrlDev;
  }

  // 这里定义不同的接口路径
  static String get getCategorySwiper => "/api/bestCate";
  static String get getFocus =>"/api/focus";
  static String get getBestSelling =>"/api/focus?position=2";
  static String get getBestSellingPlist =>"/api/plist?is_hot=1&pageSize=3";
  // 拼接完整的 URL
  static String getCategorySwiperUrl() {
    return "$baseUrl$getCategorySwiper";
  }

  static String getFocusUrl() {
    return "$baseUrl$getFocus";
  }
  static String getBestSellingUrl() {
    return "$baseUrl$getBestSelling";
  }
  static String getBestSellingPlistUrl() {
    return "$baseUrl$getBestSellingPlist";
  }
}
