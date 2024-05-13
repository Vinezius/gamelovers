import 'package:gamelovers/auth.dart';
import 'package:gamelovers/pages/home_page.dart';
import 'package:gamelovers/pages/login_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: Auth().authStateChanges,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasData) {
        return const HomePage();
      } else {
        return const LoginPage();
      }
    },
    );
  }
}