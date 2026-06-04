import 'package:employment_directory_app/model/model.dart';
import 'package:employment_directory_app/services/services.dart';
import 'package:flutter/material.dart';

class EmployeeProvider extends ChangeNotifier {
  final ApiService service;
  List<Employee> employees = [];
  bool isLoading = false;
  String? error;

  EmployeeProvider({required this.service}) {
    loadEmployee();
  }

  bool get hasEmployee => employees.isNotEmpty;

  Future<void> refresh() async {
    await loadEmployee();
  }

  Future<void> loadEmployee() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final fetched = await service.fetchEmployee();
      final unique = {for (var e in fetched) e.id: e}.values.toList();
      employees = unique;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      await loadEmployee();
    } else {
      final lower = query.toLowerCase();
      employees = employees
          .where((e) => e.name.toLowerCase().contains(lower))
          .toList();
          notifyListeners();
    }
  }
}
