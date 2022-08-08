import 'dart:convert';

import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class ApiViewModel extends BaseViewModel {
  var hasErrorVar;
  var downloads1;
  var downloads2;
  Future<http.Response> senData() async {
    final body = <String, dynamic>{
      "category": "Apps",
      "offset": 2,
      "page": 1,
      "search": ""
    };
    final json = jsonEncode(body);
    final response = await http.post(
        Uri.parse('https://admin.qubstore.com/apk/category-vise-apks'),
        headers: {"Content-type": "application/json"},
        body: json);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      hasErrorVar = decodedResponse['hasError'];
      downloads1 = decodedResponse['apks'][0]['downloads'];
      downloads2 = decodedResponse['apks'][1]['downloads'];
      notifyListeners();
      return (response);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
