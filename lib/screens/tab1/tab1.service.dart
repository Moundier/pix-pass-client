import 'dart:convert';

import 'package:client_flutter/shared/models/storage.dart';
import 'package:client_flutter/shared/models/user.dart';
import 'package:http/http.dart';
import 'package:client_flutter/shared/config/constants.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  output: ConsoleOutput(),
  printer: SimplePrinter()
);

class Tab1Service {

  Future<Response> createStorage(String note, String label, User user) async {
    final Map<String, dynamic> body = {
      'note': note,
      'label': label,
      'user': user.toJson(), // Ensure User class has a toJson method
    };

    logger.f('Body: $body');

    final response = await post(
      Uri.parse('$url:9090/storage'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create storage');
    }

    return response;
  }

  Future<Response> locateAllStorage(User user) async {
    try {
      final response = await post(
        Uri.parse('$url:9090/storage/all'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(user),
      );
      if (response.statusCode != 200) return response;
      return response;
    } catch (e) {
      return Response("", 500); // or handle error in a different way
    }
  }

  Future<Response> deleteStorage(Storage storage) async {

    try {
      final response = await post(
        Uri.parse('$url:9090/storage'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'storage': storage}),
      );
      if (response.statusCode != 200) return response;
      jsonDecode(response.body);
      return response;
    } catch (e) {
      return Response("", 500); // or handle error in a different way
    }
  }

}