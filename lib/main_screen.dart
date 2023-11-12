import 'package:cinemax/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:cinemax/web_screen.dart';
import 'package:cinemax/mobile_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const AuthScreen(),
          title: Text(
            'Cinemax App. Size of screen: ${MediaQuery.of(context).size.width}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return const WebScreen();
          } else {
            return const MobileScreen();
          }
        }));
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeProvider>(context).isDarkMode,
      onChanged: (value) {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
    );
  }
}
