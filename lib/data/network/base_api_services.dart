abstract class BaseApiServices {
  // for getapi
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);
}
