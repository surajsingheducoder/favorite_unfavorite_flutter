import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';

class SavedMembersScreen extends StatefulWidget {
  const SavedMembersScreen({super.key});

  @override
  State<SavedMembersScreen> createState() => _SavedMembersScreenState();
}

class _SavedMembersScreenState extends State<SavedMembersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.favoriteUsers.isEmpty) {
            return const Center(child: Text('No favorite users'));
          } else {
            return ListView.builder(
              itemCount: userProvider.favoriteUsers.length,
              itemBuilder: (context, index) {
                final user = userProvider.favoriteUsers[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstName} ${user.lastName}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xff993d00)),),
                    subtitle: Text(user.email,style: const TextStyle(color: Colors.grey),),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => userProvider.toggleFavorite(user.id),
                    ),
                  );

              },
            );
          }
        },
      ),
    );
  }
}
