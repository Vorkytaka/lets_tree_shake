import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/bank/bank_manager.dart';
import 'package:taxi_app/bank/navigator/bank_navigator.dart';
import 'package:taxi_app/bank/repository/bank_repository.dart';
import 'package:taxi_app/main_screen.dart';
import 'package:taxi_app/utils/formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BankManager>(
          create: (context) => BankManager(
            repository: BankRepositoryMock(),
            formatter: FormatterImpl(),
            bankNavigator: BankNavigatorMock(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Taxi App',
        routes: {
          '/': (context) => const MainScreen(),
        },
        home: const Scaffold(),
      ),
    );
  }
}
