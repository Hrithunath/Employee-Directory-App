import 'dart:convert';

import 'package:employment_directory_app/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<List<Employee>>fetchEmployee()async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      final List<dynamic>jsonList =json.decode(response.body);
      return jsonList.map((json)=>Employee.fromJson(json)).toList();
      
    }else{
      throw Exception('Failed to Load Employee');
    }
  }
}