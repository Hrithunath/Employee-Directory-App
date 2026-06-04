import 'package:employment_directory_app/model/model.dart';
import 'package:employment_directory_app/screens/home.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key,required this.employee});
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const Home()),
            (route) => false,
          ),
        ),
        title: Text(employee.name),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(employee.email),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone'),
                  subtitle: Text(employee.phone),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.business),
                  title: const Text('Company'),
                  subtitle: Text(employee.companyName),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Address'),
                  subtitle: Text(employee.address),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}