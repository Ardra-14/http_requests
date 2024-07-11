import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {


  final url = 'https://jsonplaceholder.typicode.com/posts';
  String _data = '';

 Future<void> postData() async{
  
      final response = await post(Uri.parse(url), body: {
      'title' : 'Anything',
      'body' : 'Posting datas',
      'userId' : '1'
      }
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        // print('Data posted successfully ${response.body}');
        setState(() {
          _data = 'Data created successfully ${response.body}';
        });
      }else{
        setState(() {
          _data = 'failed to post data';
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                postData,
             
              child: Text('Send Post'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(_data),
              ),
          ],
        ),
      ),
    );
  }
}