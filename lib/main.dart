import 'package:flutter/material.dart';
import 'package:flutter_api_calling/home.dart';

import 'package:provider/provider.dart';
import 'provider/dataclass_provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DataClass()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Calling'),
      ),
      body: const Home(),
    );
  }
}
