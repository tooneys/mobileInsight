import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kgiantinsight/models/salesModel.dart';
import 'package:kgiantinsight/resources/api_common.dart';

Future<List<AnalysisView>> fetchSales() async {
  final response =
      await http.get(Uri.parse('${ApiCommon.apiUrl}/api/Sales'));

  if (response.statusCode == 200) {
    var results = jsonDecode(response.body);

    List<AnalysisView> list = results.map<AnalysisView>((result) {
      return AnalysisView.fromJson(result);
    }).toList();

    return list;
  } else {
    throw Exception('Failed to API Call');
  }
}
