import 'package:bank_contract/bank_contract.dart';
import 'package:bank_module/bank_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/main_screen.dart';
import 'package:utils/utils.dart';

BankManager? get bankManager {
  // ignore: unnecessary_const
  const isBankEnabled = const bool.fromEnvironment('BANK_ENABLED');
  if (!isBankEnabled) {
    return null;
  }

  return BankManagerImpl(
    repository: BankRepositoryMock(),
    formatter: FormatterImpl(),
    bankNavigator: BankNavigatorMock(),
  );
}

void main() {
  runApp(
    MyApp(
      bankManager: bankManager,
    ),
  );
}

class MyApp extends StatelessWidget {
  final BankManager? bankManager;

  const MyApp({
    required this.bankManager,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BankManager?>.value(
          value: bankManager,
        ),
      ],
      child: MaterialApp(
        title: 'Taxi App',
        routes: {
          '/': (context) => const MainScreen(),
        },
      ),
    );
  }
}
