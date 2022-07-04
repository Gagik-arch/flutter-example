import 'dart:convert';

class PostModel {
  int id;
  String title;
  PostModel({
    required this.id,
    required this.title,
  });

  static T fromJson<T>(String json) {
    var parsedJson = jsonDecode(json);

    if (parsedJson is List<dynamic>) {
      return parsedJson
          .map((item) => PostModel(id: item['id'], title: item['title']))
          .toList() as T;
    }
    return PostModel(id: parsedJson['id'], title: parsedJson['title']) as T;
  }
}
