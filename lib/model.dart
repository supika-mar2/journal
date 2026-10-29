import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> loadPosts() async {
  var url = Uri.parse('https://supika-mar2.github.io/journal/discuss.json');
  var res = await http.get(url);

  print('ステータスコード: ${res.statusCode}');

  if (res.statusCode != 200) throw Exception('読み込み失敗');

  List posts = jsonDecode(utf8.decode(res.bodyBytes));
  return posts;
}
