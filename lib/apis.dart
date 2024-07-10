import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample/number_fact/number_fact.dart';


Future<NumberFact> getNumberFact({required String number}) async {
 final _response =  await  http.get(Uri.parse('http://numbersapi.com/$number?json'));
//  print(_response.body);

//json decoded as map 
final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;

//converting decoded map in the above step into modelclass 'NumberFact'.
final _data = NumberFact.fromJson(_bodyAsJson);
return _data;

}