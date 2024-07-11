import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  
  String message = '';
Future <void> deleteUser(int id) async{
  final response = await delete(Uri.parse('https://reqres.in/api/users/$id')
  );
  if(response.statusCode == 204){
    print('user deleted');
    setState(() {
      message = 'user deleted';
    });
  }else{
    print('Error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                deleteUser(2);
              },
              child: const Text('Delete User'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                message,
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