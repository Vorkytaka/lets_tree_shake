import 'package:bank_contract/bank_contract.dart';
import 'package:bank_module/bank_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/main_screen.dart';
import 'package:utils/utils.dart';

BankManager? get bankManager {
  const disableBank = appFlavor == 'unbanked';
  if (disableBank) {
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
