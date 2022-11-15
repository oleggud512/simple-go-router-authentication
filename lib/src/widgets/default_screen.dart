import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DEFAULT SCREEN")),
      body: const Center(
        child: CircularProgressIndicator()
      )
    );
  }
}