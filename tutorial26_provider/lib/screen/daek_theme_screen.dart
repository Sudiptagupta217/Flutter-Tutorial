import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/providers/theme_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Theme change")),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme),

          RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme),

          RadioListTile<ThemeMode>(
              title: Text("Syetem Mode"),
              value: ThemeMode.system,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme)
        ],
      ),
    );
  }
}
