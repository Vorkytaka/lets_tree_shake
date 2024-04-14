import '../utils/formatter.dart';
import 'model/bank_registration_result.dart';
import 'navigator/bank_navigator.dart';
import 'repository/bank_repository.dart';

class BankManager {
  final BankRepository repository;
  final Formatter formatter;
  final BankNavigator bankNavigator;

  const BankManager({
    required this.repository,
    required this.formatter,
    required this.bankNavigator,
  });

  Future<bool> get hasBankAccount async {
    final account = await repository.getAccount();
    return account != null;
  }

  Future<String?> get balance async {
    final currentBalance = await repository.getBalance();

    if (currentBalance == null) {
      return null;
    }

    return formatter.formatCurrency(currentBalance);
  }

  Future<BankRegistrationResult> startRegistrationFlow() {
    return bankNavigator.startRegistrationFlow();
  }

  Future<void> openBankProfile() async {
    final hasAccount = await hasBankAccount;

    if (!hasAccount) {
      throw Exception('Try to open profile without account');
    }

    return bankNavigator.openProfile();
  }
}
