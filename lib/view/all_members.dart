import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';

class AllMembersScreen extends StatefulWidget {
  const AllMembersScreen({super.key});

  @override
  State<AllMembersScreen> createState() => _AllMembersScreenState();
}

class _AllMembersScreenState extends State<AllMembersScreen> {

  @override
  Widget build(BuildContext context) {
    var mainHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                final isFavorite = userProvider.favoriteUsers.contains(user);
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
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: mainHeight/30,
                    ),
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
