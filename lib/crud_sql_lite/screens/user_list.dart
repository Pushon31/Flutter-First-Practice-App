import 'package:ay_app/crud_sql_lite/db/database_helper.dart';
import 'package:ay_app/crud_sql_lite/model/user.dart';
import 'package:ay_app/crud_sql_lite/screens/user_form.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];

  fetchUsers() async {
    users = await DatabaseHelper().getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),

      // **** Floating Button must be here — NOT inside AppBar ****
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserForm()),
          );
          fetchUsers();
        },
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, i) {
          final u = users[i];
          return ListTile(
            title: Text(u.name),
            subtitle: Text('${u.email} / ${u.gender}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserForm(user: u),
                      ),
                    );
                    fetchUsers();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await DatabaseHelper().deleteUser(u.id!);
                    fetchUsers();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
