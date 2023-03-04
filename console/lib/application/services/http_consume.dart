import 'package:console/application/protocols/http_client.dart';

dynamic consume(HttpClient service) async {
  return await service.fetchJson();
}
