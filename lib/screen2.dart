import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  String resultData = '';

  Future<void> updateUser(int id, String name, String job) async {
    final response = await put(
      Uri.parse('https://reqres.in/api/users/$id'),
      body: jsonEncode(<String, String>{
        'name': name,
        'job': job,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      setState(() {
        resultData = 'User Updated:\nName: ${responseData['name']}\nJob: ${responseData['job']}\nUpdated At: ${responseData['updatedAt']}';
      });
    } else {
      setState(() {
        resultData = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                updateUser(1, 'John', 'Manager');
              },
              child: const Text('Update User'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                resultData,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
