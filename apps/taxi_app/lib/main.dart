import 'package:bank_contract/bank_contract.dart';
import 'package:bank_module/bank_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/main_screen.dart';
import 'package:utils/utils.dart';

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
          create: (context) => BankManagerImpl(
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
