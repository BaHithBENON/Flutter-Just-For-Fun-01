class ApiRoutes {
  static const String apiPreffix = "http://localhost:8765";
  static const String rewardUrlGetReward = "$apiPreffix/route/{parameter}";


  static String replaceUrlParams(List<dynamic> values, String url) {
    String modifiedUrl = url;

    for (int i = 0; i < values.length; i++) {
      modifiedUrl = modifiedUrl.replaceFirst(RegExp('{.*?}'), values[i].toString());
    }

    return modifiedUrl;
  }
}