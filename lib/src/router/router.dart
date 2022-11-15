import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_go_router_authentication/src/features/auth/data/auth_repository.dart';
import 'package:simple_go_router_authentication/src/features/auth/presentation/auth_screen.dart';
import 'package:simple_go_router_authentication/src/features/home/presentation/home_screen.dart';
import 'package:simple_go_router_authentication/src/features/profile/presentation/profile_screen.dart';

import '../widgets/default_screen.dart';
import 'go_router_refresh_stream.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  var authRepo = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authRepo.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = authRepo.currentUser != null;
      if (isLoggedIn && state.location == '/auth') {
        return '/home';
      } else if (!isLoggedIn && state.location != '/auth') {
        return '/auth';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'default',
        builder: (context, state) => const DefaultScreen()
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder:(context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen()
          )
        ]
      )
    ]
  );
});