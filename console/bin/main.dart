import 'dart:io';
import 'package:console/application/services/http_consume.dart' as http_consume;
import 'package:console/application/services/body_mass_index.dart';
import 'package:console/infra/http/dio_http_client.dart';
import 'package:console/infra/http/http_http_client.dart';

const String promptMessage = "Select an option:\n"
    "(1) Run Http call with Http\n"
    "(2) Run Http call with Dio\n"
    "(3) Run body mass index\n"
    "(exit) To exit";
const String invalidInputMessage =
    "Please select one of the available options by typing the corresponding number.";
const String invalidOptionMessage =
    "Please select a valid option to continue. Please try again.";
const String shouldContinueMessage = "Do you want to continue? y or n";

void main(List<String> args) async {
  cleanTerminal();
  String? input;

  while (input != 'exit') {
    print(promptMessage);
    input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      cleanTerminal();
      print(invalidInputMessage);
      continue;
    }

    switch (input) {
      case '1':
        final data = await http_consume.consume(HttpHttpClient());
        print(data);
        break;
      case '2':
        final data = await http_consume.consume(DioHttpClient());
        print(data);
        break;
      case '3':
        print(bodyMassIndex(height: 1.89, weight: 97.5));
        break;
      case 'exit':
        continue;
      default:
        cleanTerminal();
        print(invalidOptionMessage);
        continue;
    }

    if (shouldContinue()) {
      cleanTerminal();
    } else {
      exit(0);
    }
  }
}

bool shouldContinue() {
  print(shouldContinueMessage);
  String? input = stdin.readLineSync();

  return input == 'y';
}

void cleanTerminal() {
  stdout.write('\x1B[2J\x1B[0;0H');
}
