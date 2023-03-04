import 'package:console/application/protocols/http_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHttpClient implements HttpClient {
  @override
  Future<Map> fetchJson() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    return jsonDecode(response.body);
  }
}
