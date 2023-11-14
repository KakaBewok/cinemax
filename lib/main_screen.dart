import 'package:cinemax/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:cinemax/web_screen.dart';
import 'package:cinemax/mobile_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return const WebScreen();
      } else {
        return const MobileScreen();
      }
    }));
  }
}

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

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
