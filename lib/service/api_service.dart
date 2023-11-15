import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter/configs/constants.dart';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.100.8:2101/api/users';

  Future<void> createUser(BuildContext context, UserModel user) async {
    logger.i("API Called");
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    logger.i('RESPONSE: $response');

    if (response.statusCode == 200) {
      logger.i('User created successfully');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("User created successfully!"),
      ));
    } else {
      logger.i('Failed to create user. Status code: ${response.statusCode}');
      logger.i('Response body: ${response.body}');
    }
  }
}
