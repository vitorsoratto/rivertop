import 'package:flutter/material.dart';
import 'package:rivertop/state/auth/backend/authenticator.dart';
import 'package:rivertop/util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rivertop'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final res = await Authenticator().signInWithGoogle();
                res.log();
              },
              child: const Text('Sign in with Google'),
            ),
          ),
        ],
      ),
    );
  }
}

