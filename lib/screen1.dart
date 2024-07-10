import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  final url = 'https://jsonplaceholder.typicode.com/posts';

  void postData() async{
  try{
      final response = await post(Uri.parse(url), body: {
      'title' : 'Anything',
      'body' : 'Posting datas',
      'userId' : '1'
      }
    
    );
    print(response.body);
  }catch(er){

  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            postData();
          }, 
          child: Text('Send Post'),
          ),
      ),
    );
  }
}