import 'package:console/application/protocols/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClient {
  final dio = Dio();

  @override
  Future<Map> fetchJson() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  }
}
