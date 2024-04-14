import 'package:bank_contract/bank_contract.dart';
import 'package:utils/utils.dart';

import 'navigator/bank_navigator.dart';
import 'repository/bank_repository.dart';

class BankManagerImpl implements BankManager {
  final BankRepository repository;
  final Formatter formatter;
  final BankNavigator bankNavigator;

  const BankManagerImpl({
    required this.repository,
    required this.formatter,
    required this.bankNavigator,
  });

  @override
  Future<bool> get hasBankAccount async {
    final account = await repository.getAccount();
    return account != null;
  }

  @override
  Future<String?> get balance async {
    final currentBalance = await repository.getBalance();

    if (currentBalance == null) {
      return null;
    }

    return formatter.formatCurrency(currentBalance);
  }

  @override
  Future<BankRegistrationResult> startRegistrationFlow() {
    return bankNavigator.startRegistrationFlow();
  }

  @override
  Future<void> openBankProfile() async {
    final hasAccount = await hasBankAccount;

    if (!hasAccount) {
      throw Exception('Try to open profile without account');
    }

    return bankNavigator.openProfile();
  }
}
