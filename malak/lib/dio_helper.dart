import 'package:dio/dio.dart';
import '/globals.dart' as globals;
import 'dart:async';

class DioHelper {
  static Dio? dio;
  static List<Map>? courseList;
  static intit() {
    dio = Dio(BaseOptions(
      baseUrl: "https://attendance-proof-production.up.railway.app/",
      receiveDataWhenStatusError: true,
    ));
    /*(dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      print('onHttpClientCreate entered...'); // this code is never reached
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
  }
  static Future<Response> login(
      {required String email, required String password}) async {
    final request = {"username": email, "password": password};
    Response response = Response(requestOptions: RequestOptions(contentType: "application/json"));
    response= await dio!.post("login/", data: request);

    if (response.statusCode == 200) {
      globals.islogin = true;
      globals.token = response!.data['access'];
      //  print(globals.token);

      // userInformation();
      // getCourses();
      // getDepartment();
      // getLevel();
      return response!;

      print(response);
    }

    return response!;
  }
}