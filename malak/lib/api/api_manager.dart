import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
// import 'package:malak/api_model/DoctorCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_model/DoctorCourses.dart';


class ApiManeger {
  static const String baseUrl = "https://attendance-proof-production.up.railway.app/";

  static Future <DoctorCourses> GetDoctorCourses() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.get('DoctorId');
    Uri url = Uri.parse("https://attendance-proof-production.up.railway.app/collage/teachers/?user=$userId");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    DoctorCourses student = DoctorCourses.fromJson(json);
    print(student);
    return student ;
  }

}