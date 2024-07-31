import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/manage_item_provider.dart';
import 'view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ManageItemProvider>(
          create: (context) => ManageItemProvider(),
        ),
      ], child: const HomeScreen()),
    );
  }
}
