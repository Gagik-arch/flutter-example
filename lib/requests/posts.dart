import './api.dart' show Api;
import 'dart:core';
import 'dart:convert';

class _PostApi extends Api {
  _PostApi() : super('/posts');

  getPosts() {
    Map b = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    post(url: '', body: b).then((res) {
      print(jsonDecode(res.body));
    }).catchError((e) => print('$e === ERROR2123123'));
  }
}

final postApi = _PostApi();
