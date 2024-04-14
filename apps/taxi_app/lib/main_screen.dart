import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/bank/bank_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO
            },
            child: const Text('Заказать такси'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              context.read<BankManager>().openBankProfile();
            },
            child: const Text('Банковский профиль'),
          ),
        ],
      ),
    );
  }
}
