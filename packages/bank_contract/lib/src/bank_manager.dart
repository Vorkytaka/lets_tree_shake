import '../bank_contract.dart';

abstract class BankManager {
  Future<bool> get hasBankAccount;

  Future<String?> get balance;

  Future<BankRegistrationResult> startRegistrationFlow();

  Future<void> openBankProfile();
}
