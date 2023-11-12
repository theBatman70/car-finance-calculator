import 'package:car_finance_calc/model/car.dart';
import 'package:car_finance_calc/model/loan_option.dart';
import 'package:car_finance_calc/view_model/result_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/screens/home_page/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Car()),
    ChangeNotifierProvider(create: (_) => LoanOption()),
    ChangeNotifierProvider(create: (_) => ViewToggle())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(37, 36, 34, 1)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
