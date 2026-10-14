import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String subtitle;
  const AppHeader({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BaBook',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(subtitle, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const CircleAvatar(radius: 17, child: Text('A')),
        ],
      ),
    );
  }
}