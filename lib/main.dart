import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rivertop/firebase_options.dart';
import 'package:rivertop/home_page.dart';
import 'package:rivertop/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverclone',
      themeMode: ThemeMode.dark,
      darkTheme: AppStyle.darkTheme,
      theme: AppStyle.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
