import 'package:bawabetdamascus/data/controllers/user_controller.dart';
import 'package:bawabetdamascus/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'add_edit_user_screen.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  String selectedRole = "All";
  final TextEditingController searchController = TextEditingController();
  final UserController userController = UserController();

  List<String> roles = [
    "All",
    'admin', 'owner', 'manager', 'systemManagers', 'waiter', 'accountant', 'kitchen', 'stock', 'delivery', 'employee'
  ];

  // فلترة المستخدمين حسب البحث والدور
  List<UserModel> filterUsers(List<UserModel> users) {
    final query = searchController.text.toLowerCase();
    return users.where((u) {
      final matchesSearch = u.name.toLowerCase().contains(query);
      final matchesRole = selectedRole == "All" || (u.roles?.contains(selectedRole) ?? false);
      return matchesSearch && matchesRole;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(lang.user_management)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEditUserScreen()),
          ).then((_) => setState(() {}));
        },
        label: Text(lang.add_user),
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
                hintText: lang.search_user_hint,
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
                labelText: lang.filter_by_role,
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
              child: StreamBuilder<List<UserModel>>(
                stream: userController.read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(lang.error_fetching_users));
                  }

                  final users = snapshot.data ?? [];
                  final filtered = filterUsers(users);

                  if (filtered.isEmpty) {
                    return Center(child: Text(lang.no_users));
                  }

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final user = filtered[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: user.image != null && user.image!.isNotEmpty
                                ? NetworkImage(user.image!)
                                : null,
                            child: user.image == null || user.image!.isEmpty
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          title: Text(user.name),
                          // عرض كل الأدوار كمثال: admin, waiter
                          subtitle: Text(user.roles?.join(", ") ?? ""),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddEditUserScreen(user: user),
                              ),
                            ).then((_) => setState(() {}));
                          },
                        ),
                      );
                    },
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
