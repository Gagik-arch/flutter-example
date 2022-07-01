import './api.dart' show Api;
import 'dart:core';
import 'dart:convert';

class PostApi extends Api {
  PostApi() : super('/posts');

  getPosts() {
    Map b = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    return post(url: '', body: b).then((res) {
      // print(jsonDecode(res.body)['title']);
    }).catchError((e) => print('$e === ERROR2123123'));
  }
}
