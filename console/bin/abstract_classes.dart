// import 'package:abstract_classes/abstract_classes.dart' as abstract_classes;

// void main(List<String> arguments) {
//   print('Hello world: ${abstract_classes.calculate()}!');
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  consume(DioJsonService());
  consume(HttpJsonService());
}

abstract class JsonService {
  Future<Map> fetchJson();
}

void consume(JsonService service) async {
  final data = await service.fetchJson();
  print(data);
}

class HttpJsonService implements JsonService {
  @override
  Future<Map> fetchJson() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    return jsonDecode(response.body);
  }
}

class DioJsonService implements JsonService {
  final dio = Dio();

  @override
  Future<Map> fetchJson() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  }
}
