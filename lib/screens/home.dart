import 'package:employment_directory_app/provider/provider.dart';
import 'package:employment_directory_app/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade600,
        title: Text('Home', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF0F0F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              onChanged: (value) => provider.search(value),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: provider.refresh,
              child: Builder(
                builder: (_) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.error != null) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Error: ${provider.error}'),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: provider.refresh,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  if (provider.employees.isEmpty) {
                    return const Center(child: Text('No employees found'));
                  }
                  return ListView.builder(
                    itemCount: provider.employees.length,
                    itemBuilder: (context, index) {
                      final emp = provider.employees[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: Text(emp.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${emp.email}'),
                              Text('Phone: ${emp.phone}'),
                            ],
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Details(employee: emp),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}