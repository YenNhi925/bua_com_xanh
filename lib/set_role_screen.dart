import 'package:flutter/material.dart';

class SetRoleScreen extends StatefulWidget {
  const SetRoleScreen({super.key});

  @override
  State<SetRoleScreen> createState() => _SetRoleScreenState();
}

class _SetRoleScreenState extends State<SetRoleScreen> {
  // Danh sách user giả lập
  List<Map<String, String>> users = [
    {'email': 'user1@example.com', 'role': 'user'},
    {'email': 'user2@example.com', 'role': 'admin'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Role cho User')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          String currentRole = user['role']!;

          return ListTile(
            title: Text(user['email']!),
            subtitle: Text('Role: $currentRole'),
            trailing: DropdownButton<String>(
              value: currentRole,
              items: const [
                DropdownMenuItem(value: 'user', child: Text('User')),
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
                DropdownMenuItem(value: 'shipper', child: Text('Shipper')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    users[index]['role'] = value;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}
