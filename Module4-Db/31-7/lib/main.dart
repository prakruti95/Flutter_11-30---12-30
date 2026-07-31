import 'package:flutter/material.dart';
import 'screens/bill_form_screen.dart';

void main()
{
  runApp(const BillGeneratorApp());
}

class BillGeneratorApp extends StatelessWidget {
  const BillGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Industry Bill Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
      home: const BillFormScreen(),
    );
  }
}
