import 'package:flutter/material.dart';
import '../data/dummy_books.dart';
import '../models/book.dart';
import '../widgets/stat_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = dummyBooks.length;
    final finished =
        dummyBooks.where((b) => b.status == BookStatus.finished).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: CircleAvatar(child: Text('A'))),
          const SizedBox(height: 16),
          const Center(child: Text('Alex Reader')),
          const Center(child: Text('alex@example.com')),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Edit profile'),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatItem(value: '$total', label: 'Books'),
              StatItem(value: '$finished', label: 'Finished'),
              const StatItem(value: '12h', label: 'Reading'),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const ListTile(
            title: Text('Reading goal'),
            subtitle: Text('12 books this year'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('Notifications'),
            subtitle: Text('Reading reminders'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('Appearance'),
            subtitle: Text('Light mode'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('About BaBook'),
            subtitle: Text('Version 1.0'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}