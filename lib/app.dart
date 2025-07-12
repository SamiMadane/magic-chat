import 'package:flutter/material.dart';

class MagicChat extends StatelessWidget {
  const MagicChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MagicChat Starter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(child: Text('Hello, Flutter!')),
      ),
    );
  }
}
