import 'dart:convert';
import 'package:kgiantinsight/models/loginUserModel.dart';
import 'package:kgiantinsight/resources/api_common.dart';
import 'package:http/http.dart' as http;

Future<LoginUser> loginByIdWithPassword(String id, String pwd) async {
  final response = await http
      .get(Uri.parse('${ApiCommon.apiUrl}/api/Login?id=$id&pwd=$pwd'));

  if (response.statusCode == 200) {
    var user = jsonDecode(response.body);
    return LoginUser.fromJson(user[0]);
  } else {
    throw Exception('Failed to Login');
  }
}
