import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  String selectedRole = "All";
  final TextEditingController searchController = TextEditingController();

  // Mock data (UI only)
  final List<Map<String, dynamic>> users = [
    {"name": "Ahmad", "role": "Waiter"},
    {"name": "Omar", "role": "Cashier"},
    {"name": "Sami", "role": "Kitchen"},
    {"name": "Rami", "role": "Manager"},
    {"name": "Ali", "role": "System Manager"},
  ];

  List<String> roles = [
    "All",
    "System Manager",
    "Manager",
    "Waiter",
    "Cashier",
    "Kitchen",
    "Stock",
    "Delivery",
    "Employee",
  ];

  // -------------------------
  // FILTERED USERS GETTER
  // -------------------------
  List<Map<String, dynamic>> get filteredUsers {
    final query = searchController.text.toLowerCase();

    return users.where((u) {
      final matchesSearch = u["name"].toLowerCase().contains(query);
      final matchesRole =
          selectedRole == "All" || u["role"] == selectedRole;

      return matchesSearch && matchesRole;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/add_user_screen");
        },
        label: const Text("Add User"),
        icon: const Icon(Icons.add),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // SEARCH BAR
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search user...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),

            SizedBox(height: 12.h),

            // ROLE FILTER
            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: InputDecoration(
                labelText: "Filter by Role",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              items: roles
                  .map((role) => DropdownMenuItem(
                value: role,
                child: Text(role),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),

            SizedBox(height: 12.h),

            // USERS LIST
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(user["name"]),
                      subtitle: Text(user["role"]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/edit_user",
                          arguments: user,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
