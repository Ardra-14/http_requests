import 'package:flutter/material.dart';
import 'package:sample/apis.dart';

class HomeScreen extends StatefulWidget {


 HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _resultText = "Enter a number and get result";

  final _numberInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: _numberInputController,
                keyboardType: TextInputType.number,
                decoration : InputDecoration(
                  border : OutlineInputBorder(),
                   hintText : "Enter a number",
                ),
              ),
            ),
            OutlinedButton(
              // onPressed: (){
                
              //   getNumberFact(number : 90);
              // },
              onPressed: () async {
                final _number = _numberInputController.text;
                // getNumberFact(number : _number);
                final _result = await getNumberFact(number: _number);
                setState(() {
                  _resultText = _result.text ?? 'No text found';
                });
              },
              child: Text("Get Result"),
              ),
              Text(_resultText),
          ],
        ),
      ),
    );
  }
}