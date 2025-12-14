import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  final List<String> _mockUsers = const [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _mockUsers.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final user = _mockUsers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user[0]),
            ),
            title: Text(user),
            subtitle: const Text('Tap to chat'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: user,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New chat feature coming soon!')),
          );
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
