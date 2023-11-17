import 'package:flutter/material.dart';

import '../configs/constants.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ApiService _apiService = ApiService();

  void _createUser() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      logger.i('Username: $username');
      logger.i('Password: $password');
      final UserModel user = UserModel(username: username, password: password);
      await _apiService.createUser(context, user);
    } else {
      // Handle empty fields
      logger.i('Username and password are required.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text('REGISTER'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'LOGIN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
