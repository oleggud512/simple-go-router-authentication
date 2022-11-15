import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_go_router_authentication/src/features/auth/data/auth_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("home")),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('sign out'),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
            },
          ),
          ElevatedButton(
            child: const Text('profile screen'),
            onPressed: () {
              context.goNamed("profile");
            },
          )
        ]
      )
    );
  }
}