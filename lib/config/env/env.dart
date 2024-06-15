class Env {
  ///开发环境
  static const String dev = "dev";

  ///测试环境
  static const String test = "test";

  ///测试环境
  static const String pre = "pre";

  ///正式环境
  static const String prod = "prod";

  static String getEnvConfig({String env = dev}) {
    switch (env) {
      case test:
        return 'http://8.142.109.85:9099/';
      case pre:
        return 'http://8.142.109.85:9099/';
      case prod:
        return 'http://8.142.109.85:9099/';
      default:
        return 'http://192.168.0.6:9099/';
    }
  }
}
