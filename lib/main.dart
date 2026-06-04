import 'package:employment_directory_app/provider/provider.dart';
import 'package:employment_directory_app/screens/home.dart';
import 'package:employment_directory_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmployeeProvider(service: ApiService()),
      child: MaterialApp(home: Home()),
    );
  }
}
