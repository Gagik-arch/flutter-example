import 'package:http/http.dart' as http;
import 'dart:convert';

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

class Api {
  String? baseUrl;
  bool? cleanRequest;

  Api({this.baseUrl = '', this.cleanRequest});

  Future<http.Response> get(String url) {
    return _configureRequest(url: url);
  }

  Future<http.Response> post({String url = '', body = Map<String, dynamic>}) {
    return _configureRequest(url: url, method: 'post', body: body);
  }

  Future<http.Response> _configureRequest({
    String url = '',
    String? method = 'get',
    body = Map<String, dynamic>,
  }) async {
    const String token = ''; //localStorage.getItem('token')
    print('$baseUrl   == 12123');
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (token.isNotEmpty) headers['Authorization'] = token;
    url = cleanRequest == true
        ? '$baseUrl$url'
        : 'https://jsonplaceholder.typicode.com$baseUrl$url';
    final URL = Uri.parse(url);

    late http.Response response;

    switch (method) {
      case 'get':
        response = await http.get(URL, headers: headers);
        break;
      case 'post':
        response =
            await http.post(URL, headers: headers, body: jsonEncode(body));
        break;
      case 'put':
        response = await http.put(URL, headers: headers);
        break;
      case 'delete':
        response = await http.delete(URL, headers: headers);
        break;
    }
    try {
      if (response.ok) {
        return response;
      } else {
        throw Exception('Request Error: ${response.statusCode}');
      }
    } on Exception {
      rethrow;
    }
  }
}
