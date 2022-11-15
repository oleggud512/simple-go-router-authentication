import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_go_router_authentication/src/features/auth/data/auth_repository.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("PROFILE SCREEN")),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('sign out'),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
            },
          )
        ]
      )
    );
  }
}