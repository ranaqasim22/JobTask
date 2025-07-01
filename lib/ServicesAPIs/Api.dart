import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>?> getData() async {
    try {
      final res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
        },
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
        return data;
      }
      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
